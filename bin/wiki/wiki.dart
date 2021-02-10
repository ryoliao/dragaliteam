import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:dragaliteam/proto/dragali.pb.dart' as pb;
import 'package:html/parser.dart' as html;
import 'package:dragaliteam/util.dart';
import 'package:meta/meta.dart';

const int LIMIT = 500;
const String _wyrmprintDir = 'assets/image/wyrmprint/';
const String _abilityDir = 'assets/image/ability/';
const String _adventurerDir = 'assets/image/character/';
const String _skillDir = 'assets/image/skill/';
const String _weaponDir = 'assets/image/weapon/';
const String _dragonDir = 'assets/image/dragon/';

pb.AdventurerClass classOf(String name) {
  return pb.AdventurerClass.values.firstWhere(
    (e) => e.name == name,
    orElse: () {
      print('unknown adventurer type $name');
      return pb.AdventurerClass.NoAdventurerClass;
    },
  );
}

pb.ElementKind elementOf(String name) {
  if (name == "None") return pb.ElementKind.NoElement;
  return pb.ElementKind.values.firstWhere(
    (e) => e.name == name,
    orElse: () {
      print('unknown element $name');
      return pb.ElementKind.NoElement;
    },
  );
}

pb.WeaponKind weaponOf(String name) {
  return pb.WeaponKind.values.firstWhere(
    (e) => e.name == name,
    orElse: () {
      print('unknown weapon $name');
      return pb.WeaponKind.NoWeapon;
    },
  );
}

String adventurerIcon(String id, String variationId, String rarity) {
  return "${id}_0${variationId}_r0$rarity.png";
}

String weaponIcon(String id, String formId) {
  return "${id}_01_$formId.png";
}

String dragonIcon(String id) {
  return "${id}_01.png";
}

String skillIcon(String icon) {
  icon = icon.replaceAll(' ', '_');
  return icon + ".png";
}

String abilityIcon(String icon) {
  return icon + ".png";
}

Future<String> _wyrmprintImageChoose(String id) async {
  var name = "${id}_02.png";
  if (await File('$_wyrmprintDir$name').exists()) return name;
  return "${id}_01.png";
}

int idAdventurer(String id, String variationId) {
  return adventurerId(
    int.parse(id.substring(0, 2)),
    int.parse(id.substring(2)),
    int.parse(variationId),
  );
}

Future _downloadAdventurerIcon(
    String id, String variationId, String rarity) async {
  var name = adventurerIcon(id, variationId, rarity);
  if (!await File('$_adventurerDir$name').exists()) {
    await _downloadImage(_adventurerDir, name);
  }
}

Future _downloadWyrmprintIcon(String id) async {
  var name1 = "${id}_01.png";
  var name2 = "${id}_02.png";
  if (!await File('$_wyrmprintDir$name1').exists()) {
    await _downloadImage(_wyrmprintDir, name1);
  }
  if (!await File('$_wyrmprintDir$name2').exists()) {
    await _downloadImage(_wyrmprintDir, name2);
  }
}

Future _downloadAbilityIcon(String icon) async {
  var name = abilityIcon(icon);
  if (!await File('$_abilityDir$name').exists()) {
    await _downloadImage(_abilityDir, name);
  }
}

Future _downloadWeaponIcon(String id, String formId) async {
  var name = weaponIcon(id, formId);
  if (!await File('$_weaponDir$name').exists()) {
    await _downloadImage(_weaponDir, name);
  }
}

Future _downloadDragonIcon(String id) async {
  var name = dragonIcon(id);
  if (!await File('$_dragonDir$name').exists()) {
    await _downloadImage(_dragonDir, name);
  }
}

Future _downloadSkillIcon(String icon) async {
  var name = skillIcon(icon);
  if (!await File('$_skillDir$name').exists()) {
    await _downloadImage(_skillDir, name);
  }
}

Future _downloadImage(String dir, String filename) async {
  print('try to get $filename from wiki ...');
  var resp =
      await http.get('https://dragalialost.gamepedia.com/File:$filename');
  var doc = html.parse(resp.body);
  var file = doc.getElementById('file');
  if (file != null) {
    var fileUrl = file.firstChild.attributes['href'];
    print('downloading ... $filename');
    resp = await http.get(fileUrl);
    await File("$dir$filename").writeAsBytes(resp.bodyBytes);
  } else {
    print('No file by $filename exists');
  }
}

Stream<T> query<T>({
  @required String tables,
  @required List<String> fields,
  @required Future<T> Function(Map<String, dynamic>) builder,
  Map<String, String> args,
}) async* {
  int offset = 0;
  String queryFields = fields.join(',');
  while (true) {
    print("GET $tables OFFSET $offset ...");
    var uri = "https://dragalialost.gamepedia.com/api.php?action=cargoquery"
        "&limit=$LIMIT"
        "&format=json"
        "&tables=$tables"
        "&fields=$queryFields"
        "&offset=$offset";
    if (args != null) {
      uri = uri + args.entries.map((e) => "&${e.key}=${e.value}").join();
    }
    var resp = await http.get(uri);

    Map<String, dynamic> json = jsonDecode(resp.body);
    List entries = json['cargoquery'];
    for (var obj in entries.map((e) => e['title'])) {
      yield await builder(obj);
    }
    if (entries.length < LIMIT) break;
    offset += LIMIT;
  }
}

Stream<T> queryMany<T>({
  @required String tables,
  @required List<String> fields,
  @required Future<List<T>> Function(Map<String, dynamic>) builder,
}) async* {
  var strm = query<List<T>>(
    tables: tables,
    fields: fields,
    builder: (obj) async => await builder(obj),
  );
  await for (var list in strm) {
    for (var item in list) yield item;
  }
}

Stream<MapEntry<int, pb.Wyrmprint>> getWyrmprints() {
  return query(
    tables: "Wyrmprints",
    fields: [
      "BaseId=Id",
      "Name",
      "Rarity",
      "Abilities11",
      "Abilities12",
      "Abilities13",
      "Abilities21",
      "Abilities22",
      "Abilities23",
      "UnionAbilityGroupId"
    ],
    builder: (obj) async {
      await _downloadWyrmprintIcon(obj['Id']);
      return MapEntry(
        int.parse(obj['Id']),
        pb.Wyrmprint.create()
          ..name = obj['Name']
          ..rarity = int.parse(obj['Rarity'])
          ..idA11 = int.parse(obj['Abilities11'])
          ..idA12 = int.parse(obj['Abilities12'])
          ..idA13 = int.parse(obj['Abilities13'])
          ..idA21 = int.parse(obj['Abilities21'])
          ..idA22 = int.parse(obj['Abilities22'])
          ..idA23 = int.parse(obj['Abilities23'])
          ..affinity = pb.AffinityKind.valueOf(
            int.parse(obj['UnionAbilityGroupId']),
          )
          ..image = await _wyrmprintImageChoose(obj['Id']),
      );
    },
  );
}

Stream<MapEntry<int, pb.Skill>> getSkills() {
  return queryMany(
    tables: "Skills",
    fields: [
      "SkillId=Id",
      "SkillLv1IconName=Icon",
      "Name",
    ],
    builder: (obj) async {
      var image = skillIcon(obj['Icon']);
      await _downloadSkillIcon(obj['Icon']);
      var skill = pb.Skill.create()
        ..name = obj['Name']
        ..image = image;

      String id = obj['Id'];
      var idList = id.split(',');
      return idList
          .map((e) => MapEntry(
                int.parse(e),
                skill.clone(),
              ))
          .toList();
    },
  );
}

Stream<MapEntry<int, pb.Weapon>> getWeapons() {
  return query(
    tables: "Weapons,WeaponSkin",
    fields: [
      "WeaponSkin.BaseId=Id",
      "WeaponSkin.FormId=FormId",
      "Weapons.Name=Name",
      "Weapons.Rarity=Rarity",
      "Weapons.ElementalType=Element",
      "Weapons.WeaponType=Type",
      "ChangeSkillId3=SkillId",
      // "Abilities13",
      // "Abilities23"
    ],
    args: {
      "group_by": "Weapons._pageName",
      "join_on": "Weapons.WeaponSkinId=WeaponSkin.Id",
      "where": 'Weapons.Name!="Zethia\'s Staff" AND CreateStartDate <= NOW()',
    },
    builder: (obj) async {
      var image = weaponIcon(obj['Id'], obj['FormId']);
      await _downloadWeaponIcon(obj['Id'], obj['FormId']);
      return MapEntry(
        int.parse(obj['Id']),
        pb.Weapon.create()
          ..name = obj['Name']
          ..element = elementOf(obj['Element'])
          ..rarity = int.parse(obj['Rarity'])
          ..weapon = weaponOf(obj['Type'])
          ..idSkill = int.parse(obj['SkillId'])
          ..image = image,
      );
    },
  );
}

Stream<MapEntry<int, pb.Dragon>> getDragons() {
  return query(
    tables: "Dragons",
    fields: [
      "FullName=Name",
      "Rarity",
      "ElementalType=Element",
      "BaseId=Id",
      "SkillID",
      // "Abilities15",
      // "Abilities25",
    ],
    args: {"where": "IsPlayable!=0 AND ReleaseDate <= NOW()"},
    builder: (obj) async {
      var image = dragonIcon(obj['Id']);
      await _downloadDragonIcon(obj['Id']);
      return MapEntry(
        int.parse(obj['Id']),
        pb.Dragon.create()
          ..name = obj['Name']
          ..rarity = int.parse(obj['Rarity'])
          ..element = elementOf(obj['Element'])
          ..idSkill = int.parse(obj['SkillID'])
          ..image = image,
      );
    },
  );
}

Stream<MapEntry<int, pb.Ability>> getAbilities(String table) {
  return query(
    tables: table,
    fields: [
      "Id",
      "AbilityIconName=Icon",
      "Name",
    ],
    builder: (obj) async {
      var image = abilityIcon(obj['Icon']);
      await _downloadAbilityIcon(obj['Icon']);
      return MapEntry(
        int.parse(obj['Id']),
        pb.Ability.create()
          ..name = obj['Name']
          ..image = image,
      );
    },
  );
}

Stream<MapEntry<int, pb.ShareableSkill>> getShareableSkills() async* {
  var adQuery = query(
    tables: "Adventurers",
    fields: [
      "Id",
      "VariationId",
      "EditSkillId",
      "EditSkillCost",
    ],
    args: {
      "where": "Adventurers.EditSkillID != \"0\"",
      "order_by":
          "Adventurers.ElementalTypeId ASC, Adventurers.Rarity DESC, Adventurers.WeaponTypeId ASC"
    },
    builder: (obj) async {
      var id = idAdventurer(obj['Id'], obj['VariationId']);
      return MapEntry(
        id,
        pb.ShareableSkill.create()
          ..from = pb.ShareableSkillFrom.SkillFromAdventurer
          ..idSkill = int.parse(obj['EditSkillId'])
          ..cost = int.parse(obj['EditSkillCost']),
      );
    },
  );
  await for (var e in adQuery) yield e;

  adQuery = query(
    tables: "Weapons,WeaponSkin",
    fields: [
      "WeaponSkin.BaseId=Id",
      "ChangeSkillId3=SkillId",
    ],
    args: {
      "group_by": "Weapons._pageName",
      "join_on": "Weapons.WeaponSkinId=WeaponSkin.Id",
      "where": 'Weapons.ChangeSkillId3 !=\"0\"'
          ' AND Weapons.Name != "Zethia\'s Staff"'
          ' AND CreateStartDate <= NOW()',
      "order_by":
          "Weapons.ElementalTypeId ASC, Weapons.Rarity DESC, Weapons.WeaponTypeId ASC"
    },
    builder: (obj) async {
      return MapEntry(
        int.parse(obj['Id']),
        pb.ShareableSkill.create()
          ..from = pb.ShareableSkillFrom.SkillFromWeapon
          ..idSkill = int.parse(obj['SkillId'])
          ..cost = 0,
      );
    },
  );
  await for (var e in adQuery) yield e;
}

Stream<MapEntry<int, pb.Adventurer>> getAdventurers() {
  return query(
    tables: "Adventurers",
    fields: [
      "FullName=Name",
      "ElementalType=Element",
      "WeaponType=Weapon",
      "Rarity",
      "CharaType=Type",
      "Id",
      "VariationId",
      "Skill1ID",
      "Skill2ID",
      "ExAbilityData5",
      "ExAbility2Data5",
    ],
    builder: (obj) async {
      var image = adventurerIcon(
        obj['Id'],
        obj['VariationId'],
        obj['Rarity'],
      );
      var id = idAdventurer(obj['Id'], obj['VariationId']);

      await _downloadAdventurerIcon(
        obj['Id'],
        obj['VariationId'],
        obj['Rarity'],
      );

      return MapEntry(
        id,
        pb.Adventurer.create()
          ..name = obj['Name']
          ..element = elementOf(obj['Element'])
          ..weapon = weaponOf(obj['Weapon'])
          ..rarity = int.parse(obj['Rarity'])
          ..klass = classOf(obj['Type'])
          ..idSkill1 = int.parse(obj['Skill1ID'])
          ..idSkill2 = int.parse(obj['Skill2ID'])
          ..idCoAbility = int.parse(obj['ExAbilityData5'])
          ..idChainCoAbility = int.parse(obj['ExAbility2Data5'])
          ..image = image,
      );
    },
  );
}
