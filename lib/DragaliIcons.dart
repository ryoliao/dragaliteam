import 'package:flutter/material.dart';
import 'package:dragaliteam/proto/dragali.pb.dart' as pb;

class DragaliIcons {
  static AssetImage get blank => AssetImage(
        '${prefix}Icon_Ability_Blank.png',
      );
  static AssetImage get blankDragon => AssetImage(
        '${prefix}Icon_Dragon_Blank.png',
      );
  static AssetImage get blankWyrmprintA => AssetImage(
        '${prefix}Icon_Wyrmprint_Blank_A.png',
      );
  static AssetImage get blankWyrmprintB => AssetImage(
        '${prefix}Icon_Wyrmprint_Blank_B.png',
      );

  static AssetImage ability(String file) => AssetImage(
        '${prefix}ability/$file',
      );
  static AssetImage adventurer(String file) => AssetImage(
        '${prefix}character/$file',
      );
  static AssetImage dragon(String file) => AssetImage(
        '${prefix}dragon/$file',
      );
  static AssetImage skill(String file) => AssetImage(
        '${prefix}skill/$file',
      );
  static AssetImage weapon(String file) => AssetImage(
        '${prefix}weapon/$file',
      );
  static AssetImage wyrmprint(String file) => AssetImage(
        '${prefix}wyrmprint/$file',
      );

  static AssetImage affinity(pb.AffinityKind kind) => AssetImage(
        '${prefix}Icon_Union_${kind.value.toString().padLeft(2, '0')}.png',
      );

  static AssetImage weaponClass(String name) => AssetImage(
        '${prefix}Icon_Weapon_$name.png',
      );
  static AssetImage element(String name) => AssetImage(
        '${prefix}Icon_Element_$name.png',
      );

  static AssetImage rarity(int rarity) => AssetImage(
        '${prefix}Icon_Rarity_$rarity.png',
      );

  static const String prefix = "assets/image/";
}
