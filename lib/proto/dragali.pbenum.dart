///
//  Generated code. Do not modify.
//  source: dragali.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ElementKind extends $pb.ProtobufEnum {
  static const ElementKind NoElement = ElementKind._(0, 'NoElement');
  static const ElementKind Flame = ElementKind._(1, 'Flame');
  static const ElementKind Water = ElementKind._(2, 'Water');
  static const ElementKind Wind = ElementKind._(3, 'Wind');
  static const ElementKind Light = ElementKind._(4, 'Light');
  static const ElementKind Shadow = ElementKind._(5, 'Shadow');

  static const $core.List<ElementKind> values = <ElementKind> [
    NoElement,
    Flame,
    Water,
    Wind,
    Light,
    Shadow,
  ];

  static final $core.Map<$core.int, ElementKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ElementKind valueOf($core.int value) => _byValue[value];

  const ElementKind._($core.int v, $core.String n) : super(v, n);
}

class WeaponKind extends $pb.ProtobufEnum {
  static const WeaponKind NoWeapon = WeaponKind._(0, 'NoWeapon');
  static const WeaponKind Sword = WeaponKind._(1, 'Sword');
  static const WeaponKind Blade = WeaponKind._(2, 'Blade');
  static const WeaponKind Dagger = WeaponKind._(3, 'Dagger');
  static const WeaponKind Axe = WeaponKind._(4, 'Axe');
  static const WeaponKind Lance = WeaponKind._(5, 'Lance');
  static const WeaponKind Bow = WeaponKind._(6, 'Bow');
  static const WeaponKind Wand = WeaponKind._(7, 'Wand');
  static const WeaponKind Staff = WeaponKind._(8, 'Staff');
  static const WeaponKind Manacaster = WeaponKind._(9, 'Manacaster');

  static const $core.List<WeaponKind> values = <WeaponKind> [
    NoWeapon,
    Sword,
    Blade,
    Dagger,
    Axe,
    Lance,
    Bow,
    Wand,
    Staff,
    Manacaster,
  ];

  static final $core.Map<$core.int, WeaponKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static WeaponKind valueOf($core.int value) => _byValue[value];

  const WeaponKind._($core.int v, $core.String n) : super(v, n);
}

class AffinityKind extends $pb.ProtobufEnum {
  static const AffinityKind NoAffinity = AffinityKind._(0, 'NoAffinity');
  static const AffinityKind CrownsBoon = AffinityKind._(1, 'CrownsBoon');
  static const AffinityKind AxesBoon = AffinityKind._(2, 'AxesBoon');
  static const AffinityKind SwordsBoon = AffinityKind._(3, 'SwordsBoon');
  static const AffinityKind BowsBoon = AffinityKind._(4, 'BowsBoon');
  static const AffinityKind DragonsBoon = AffinityKind._(5, 'DragonsBoon');
  static const AffinityKind LancesBoon = AffinityKind._(6, 'LancesBoon');
  static const AffinityKind EaglesBoon = AffinityKind._(7, 'EaglesBoon');
  static const AffinityKind WolfsBoon = AffinityKind._(8, 'WolfsBoon');
  static const AffinityKind BullsBoon = AffinityKind._(9, 'BullsBoon');
  static const AffinityKind SerpentsBoon = AffinityKind._(10, 'SerpentsBoon');
  static const AffinityKind StaffsBoon = AffinityKind._(11, 'StaffsBoon');

  static const $core.List<AffinityKind> values = <AffinityKind> [
    NoAffinity,
    CrownsBoon,
    AxesBoon,
    SwordsBoon,
    BowsBoon,
    DragonsBoon,
    LancesBoon,
    EaglesBoon,
    WolfsBoon,
    BullsBoon,
    SerpentsBoon,
    StaffsBoon,
  ];

  static final $core.Map<$core.int, AffinityKind> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AffinityKind valueOf($core.int value) => _byValue[value];

  const AffinityKind._($core.int v, $core.String n) : super(v, n);
}

class AdventurerClass extends $pb.ProtobufEnum {
  static const AdventurerClass NoAdventurerClass = AdventurerClass._(0, 'NoAdventurerClass');
  static const AdventurerClass Attack = AdventurerClass._(1, 'Attack');
  static const AdventurerClass Defense = AdventurerClass._(2, 'Defense');
  static const AdventurerClass Healing = AdventurerClass._(3, 'Healing');
  static const AdventurerClass Support = AdventurerClass._(4, 'Support');

  static const $core.List<AdventurerClass> values = <AdventurerClass> [
    NoAdventurerClass,
    Attack,
    Defense,
    Healing,
    Support,
  ];

  static final $core.Map<$core.int, AdventurerClass> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AdventurerClass valueOf($core.int value) => _byValue[value];

  const AdventurerClass._($core.int v, $core.String n) : super(v, n);
}

class ShareableSkillFrom extends $pb.ProtobufEnum {
  static const ShareableSkillFrom NoShareableSkillType = ShareableSkillFrom._(0, 'NoShareableSkillType');
  static const ShareableSkillFrom SkillFromDragon = ShareableSkillFrom._(1, 'SkillFromDragon');
  static const ShareableSkillFrom SkillFromWeapon = ShareableSkillFrom._(2, 'SkillFromWeapon');
  static const ShareableSkillFrom SkillFromAdventurer = ShareableSkillFrom._(3, 'SkillFromAdventurer');

  static const $core.List<ShareableSkillFrom> values = <ShareableSkillFrom> [
    NoShareableSkillType,
    SkillFromDragon,
    SkillFromWeapon,
    SkillFromAdventurer,
  ];

  static final $core.Map<$core.int, ShareableSkillFrom> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ShareableSkillFrom valueOf($core.int value) => _byValue[value];

  const ShareableSkillFrom._($core.int v, $core.String n) : super(v, n);
}

