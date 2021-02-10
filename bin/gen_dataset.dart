import 'dart:io';
import 'package:dragaliteam/util.dart';
import 'package:dragaliteam/proto/dragali.pb.dart' as pb;
import 'package:spreadsheet_decoder/spreadsheet_decoder.dart';
import 'wiki/wiki.dart' as wiki;

void buildAbilityIcons(pb.DragaliDataset dataset) {
  var imageSet = {
    ...dataset.wyrmprints.values
        .map((print) => dataset.abilities[print.idA11].image)
  };
  dataset.abilityIcons
    ..addAll(
      imageSet.map((e) => pb.AbilityIcon.create()..image = e),
    )
    ..sort(
      (a, b) => a.image.compareTo(b.image),
    );
}

void main() async {
  var adventurers = await wiki.getAdventurers().toList();
  var weapons = await wiki.getWeapons().toList();
  var dragons = await wiki.getDragons().toList();
  var wyrmprints = await wiki.getWyrmprints().toList();
  var skills = await wiki.getSkills().toList();
  var shareableSkills = await wiki.getShareableSkills().toList();
  var abilities = [
    ...await wiki.getAbilities("Abilities").toList(),
    ...await wiki.getAbilities("CoAbilities").toList(),
    ...await wiki.getAbilities("ChainCoAbilities").toList()
  ];

  adventurers.sort((a, b) {
    var cmp = a.value.element.value.compareTo(b.value.element.value);
    if (cmp == 0) {
      cmp = b.value.rarity.compareTo(a.value.rarity);
    }
    if (cmp == 0) {
      cmp = a.value.weapon.value.compareTo(b.value.weapon.value);
    }
    return cmp;
  });
  weapons.sort((a, b) {
    var cmp = a.value.element.value.compareTo(b.value.element.value);
    if (cmp == 0) {
      cmp = b.value.rarity.compareTo(a.value.rarity);
    }
    if (cmp == 0) {
      cmp = a.value.weapon.value.compareTo(b.value.weapon.value);
    }
    return cmp;
  });
  dragons.sort((a, b) {
    var cmp = a.value.element.value.compareTo(b.value.element.value);
    if (cmp == 0) {
      cmp = b.value.rarity.compareTo(a.value.rarity);
    }
    return cmp;
  });

  var dataset = pb.DragaliDataset.create()
    ..adventurers.addEntries(adventurers)
    ..weapons.addEntries(weapons)
    ..dragons.addEntries(dragons)
    ..wyrmprints.addEntries(wyrmprints)
    ..skills.addEntries(skills)
    ..shareableSkills.addEntries(shareableSkills)
    ..abilities.addEntries(abilities);

  // patch from dataset-patch.xlsx
  {
    var bytes = await File('res/dataset-patch.xlsx').readAsBytes();
    var decoder = SpreadsheetDecoder.decodeBytes(bytes);
    patchAdventurer(dataset, decoder.tables['adventurer']);
    patchWeapon(dataset, decoder.tables['weapon']);
    patchDragon(dataset, decoder.tables['dragon']);
    patchSkill(dataset, decoder.tables['skill']);
    patchAbility(dataset, decoder.tables['ability']);
    patchShareableSkill(dataset, decoder.tables['shareable-skill']);
    patchCoAbility(dataset, decoder.tables['co-ability']);
  }

  buildAbilityIcons(dataset);

  for (var adEntry in dataset.adventurers.entries) {
    if (!adEntry.value.hasIdCoAbility()) {
      print('Adventure ${adEntry.value.name} has no CoAbility');
    }
    if (!adEntry.value.hasIdChainCoAbility()) {
      print('Adventure ${adEntry.value.name} has no Chain-CoAbility');
    }
  }

  print("== analystic ==");
  print("total ability icons: ${dataset.abilityIcons.length}");

  var buffer = dataset.writeToBuffer();
  await File('assets/dataset.bin').writeAsBytes(buffer);
}

void patchWeapon(pb.DragaliDataset dataset, SpreadsheetTable t) {
  for (var row in t.rows.skip(1)) {
    var id = row[0];
    var image = wiki.weaponIcon(
      row[0].toString(),
      row[1].toString(),
    );
    var ins = pb.Weapon.create()
      ..name = row[2]
      ..weapon = wiki.weaponOf(row[4])
      ..element = wiki.elementOf(row[5])
      ..rarity = row[6]
      ..image = image;

    if (!isNullOrZero(row[3])) {
      ins.idSkill = row[3];
    }
    dataset.weapons[id] = ins;

    if (ins.hasIdSkill()) {
      var ss = pb.ShareableSkill.create();
      ss.idSkill = ins.idSkill;
      ss.from = pb.ShareableSkillFrom.SkillFromWeapon;
      dataset.shareableSkills[id] = ss;
    }
  }
}

void patchSkill(pb.DragaliDataset dataset, SpreadsheetTable t) {
  for (var row in t.rows.skip(1)) {
    int id = row[0];
    var ins = pb.Skill.create()
      ..name = row[1]
      ..image = row[2];

    dataset.skills[id] = ins;
  }
}

void patchShareableSkill(pb.DragaliDataset dataset, SpreadsheetTable t) {
  for (var row in t.rows.skip(1)) {
    var ins = pb.ShareableSkill.create()
      ..cost = row[1]
      ..from = pb.ShareableSkillFrom.values.firstWhere((i) => i.name == row[2])
      ..idSkill = row[3];

    int key;
    switch (ins.from) {
      case pb.ShareableSkillFrom.SkillFromAdventurer:
        key = dataset.adventurers.entries
            .firstWhere((p) => p.value.name == row[0])
            .key;
        break;
      case pb.ShareableSkillFrom.SkillFromWeapon:
        key = dataset.weapons.entries
            .firstWhere((p) => p.value.name == row[0])
            .key;
        break;
      default:
        print('error: skill from ${ins.from} unsupported ');
        exit(1);
        break;
    }
    dataset.shareableSkills[key] = ins;
  }
}

void patchAbility(pb.DragaliDataset dataset, SpreadsheetTable t) {
  for (var row in t.rows.skip(1)) {
    int id = row[0];
    var ins = pb.Ability.create()
      ..name = row[1]
      ..image = row[2];

    dataset.abilities[id] = ins;
  }
}

void patchDragon(pb.DragaliDataset dataset, SpreadsheetTable t) {
  for (var row in t.rows.skip(1)) {
    int id = row[0];
    var image = wiki.dragonIcon(row[0].toString());

    var ins = pb.Dragon.create()
      ..name = row[1]
      ..element = wiki.elementOf(row[2])
      ..rarity = row[3]
      ..idSkill = row[4]
      ..image = image;

    dataset.dragons[id] = ins;
  }
}

void patchAdventurer(pb.DragaliDataset dataset, SpreadsheetTable t) {
  for (var row in t.rows.skip(1)) {
    int id = wiki.idAdventurer(
      row[0].toString(),
      row[1].toString(),
    );
    var image = wiki.adventurerIcon(
      row[0].toString(),
      row[1].toString(),
      row[4].toString(),
    );
    var ins = pb.Adventurer.create()
      ..name = row[2]
      ..element = wiki.elementOf(row[3])
      ..rarity = row[4]
      ..klass = wiki.classOf(row[5])
      ..weapon = wiki.weaponOf(row[6])
      ..idCoAbility = row[7]
      ..idChainCoAbility = row[8]
      ..idSkill1 = row[9]
      ..idSkill2 = row[10]
      ..image = image;

    dataset.adventurers[id] = ins;
  }
}

void patchCoAbility(pb.DragaliDataset dataset, SpreadsheetTable t) {
  for (var row in t.rows.skip(1)) {
    dataset.adventurers.values
        .firstWhere((element) => element.name == row[0])
        .idCoAbility = row[1];
  }
}
