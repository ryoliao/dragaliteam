import 'proto/dragali.pb.dart' as pb;
import 'util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataCenter {
  static pb.DragaliDataset instance;
  static pb.TeamSetup defaultTeam;
  static pb.AdventurerSetup adventurerClipboard;

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    var raw = await rootBundle.load('assets/dataset.bin');
    instance = pb.DragaliDataset.fromBuffer(
        raw.buffer.asUint8List(raw.offsetInBytes, raw.lengthInBytes));

    defaultTeam = pb.TeamSetup.create();
    defaultTeam.adventurer1 = pb.AdventurerSetup.create();
    defaultTeam.adventurer2 = pb.AdventurerSetup.create();
    defaultTeam.adventurer3 = pb.AdventurerSetup.create();
    defaultTeam.adventurer4 = pb.AdventurerSetup.create();
  }

  static pb.Adventurer adventurer(int id) {
    if (isNullOrZero(id)) return null;
    return instance.adventurers[id];
  }

  static pb.Wyrmprint wyrmprint(int id) {
    if (isNullOrZero(id)) return null;
    return instance.wyrmprints[id];
  }

  static pb.Dragon dragon(int id) {
    if (isNullOrZero(id)) return null;
    return instance.dragons[id];
  }

  static pb.Weapon weapon(int id) {
    if (isNullOrZero(id)) return null;
    return instance.weapons[id];
  }

  static pb.Ability ability(int id) {
    if (isNullOrZero(id)) return null;
    return instance.abilities[id];
  }

  static pb.Skill skill(int id) {
    if (isNullOrZero(id)) return null;
    return instance.skills[id];
  }

  static pb.ShareableSkill shareableSkill(int id) {
    if (isNullOrZero(id)) return null;
    return instance.shareableSkills[id];
  }
}
