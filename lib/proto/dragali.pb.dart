///
//  Generated code. Do not modify.
//  source: dragali.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'dragali.pbenum.dart';

export 'dragali.pbenum.dart';

class Skill extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Skill', package: const $pb.PackageName('dragali'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(11, 'image')
    ..hasRequiredFields = false
  ;

  Skill._() : super();
  factory Skill() => create();
  factory Skill.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Skill.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Skill clone() => Skill()..mergeFromMessage(this);
  Skill copyWith(void Function(Skill) updates) => super.copyWith((message) => updates(message as Skill));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Skill create() => Skill._();
  Skill createEmptyInstance() => create();
  static $pb.PbList<Skill> createRepeated() => $pb.PbList<Skill>();
  @$core.pragma('dart2js:noInline')
  static Skill getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Skill>(create);
  static Skill _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(11)
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(11)
  set image($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(11)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(11)
  void clearImage() => clearField(11);
}

class Adventurer extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Adventurer', package: const $pb.PackageName('dragali'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..a<$core.int>(2, 'rarity', $pb.PbFieldType.OU3)
    ..e<ElementKind>(3, 'element', $pb.PbFieldType.OE, defaultOrMaker: ElementKind.NoElement, valueOf: ElementKind.valueOf, enumValues: ElementKind.values)
    ..e<WeaponKind>(4, 'weapon', $pb.PbFieldType.OE, defaultOrMaker: WeaponKind.NoWeapon, valueOf: WeaponKind.valueOf, enumValues: WeaponKind.values)
    ..e<AdventurerClass>(5, 'klass', $pb.PbFieldType.OE, defaultOrMaker: AdventurerClass.NoAdventurerClass, valueOf: AdventurerClass.valueOf, enumValues: AdventurerClass.values)
    ..a<$core.int>(6, 'idSkill1', $pb.PbFieldType.OU3, protoName: 'id_skill_1')
    ..a<$core.int>(7, 'idSkill2', $pb.PbFieldType.OU3, protoName: 'id_skill_2')
    ..a<$core.int>(8, 'idCoAbility', $pb.PbFieldType.OU3)
    ..a<$core.int>(9, 'idChainCoAbility', $pb.PbFieldType.OU3)
    ..aOS(11, 'image')
    ..hasRequiredFields = false
  ;

  Adventurer._() : super();
  factory Adventurer() => create();
  factory Adventurer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Adventurer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Adventurer clone() => Adventurer()..mergeFromMessage(this);
  Adventurer copyWith(void Function(Adventurer) updates) => super.copyWith((message) => updates(message as Adventurer));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Adventurer create() => Adventurer._();
  Adventurer createEmptyInstance() => create();
  static $pb.PbList<Adventurer> createRepeated() => $pb.PbList<Adventurer>();
  @$core.pragma('dart2js:noInline')
  static Adventurer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Adventurer>(create);
  static Adventurer _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rarity => $_getIZ(1);
  @$pb.TagNumber(2)
  set rarity($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRarity() => $_has(1);
  @$pb.TagNumber(2)
  void clearRarity() => clearField(2);

  @$pb.TagNumber(3)
  ElementKind get element => $_getN(2);
  @$pb.TagNumber(3)
  set element(ElementKind v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasElement() => $_has(2);
  @$pb.TagNumber(3)
  void clearElement() => clearField(3);

  @$pb.TagNumber(4)
  WeaponKind get weapon => $_getN(3);
  @$pb.TagNumber(4)
  set weapon(WeaponKind v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasWeapon() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeapon() => clearField(4);

  @$pb.TagNumber(5)
  AdventurerClass get klass => $_getN(4);
  @$pb.TagNumber(5)
  set klass(AdventurerClass v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasKlass() => $_has(4);
  @$pb.TagNumber(5)
  void clearKlass() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get idSkill1 => $_getIZ(5);
  @$pb.TagNumber(6)
  set idSkill1($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIdSkill1() => $_has(5);
  @$pb.TagNumber(6)
  void clearIdSkill1() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get idSkill2 => $_getIZ(6);
  @$pb.TagNumber(7)
  set idSkill2($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasIdSkill2() => $_has(6);
  @$pb.TagNumber(7)
  void clearIdSkill2() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get idCoAbility => $_getIZ(7);
  @$pb.TagNumber(8)
  set idCoAbility($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasIdCoAbility() => $_has(7);
  @$pb.TagNumber(8)
  void clearIdCoAbility() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get idChainCoAbility => $_getIZ(8);
  @$pb.TagNumber(9)
  set idChainCoAbility($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIdChainCoAbility() => $_has(8);
  @$pb.TagNumber(9)
  void clearIdChainCoAbility() => clearField(9);

  @$pb.TagNumber(11)
  $core.String get image => $_getSZ(9);
  @$pb.TagNumber(11)
  set image($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasImage() => $_has(9);
  @$pb.TagNumber(11)
  void clearImage() => clearField(11);
}

class ShareableSkill extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ShareableSkill', package: const $pb.PackageName('dragali'), createEmptyInstance: create)
    ..a<$core.int>(1, 'cost', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, 'idSkill', $pb.PbFieldType.OU3)
    ..e<ShareableSkillFrom>(3, 'from', $pb.PbFieldType.OE, defaultOrMaker: ShareableSkillFrom.NoShareableSkillType, valueOf: ShareableSkillFrom.valueOf, enumValues: ShareableSkillFrom.values)
    ..hasRequiredFields = false
  ;

  ShareableSkill._() : super();
  factory ShareableSkill() => create();
  factory ShareableSkill.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShareableSkill.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ShareableSkill clone() => ShareableSkill()..mergeFromMessage(this);
  ShareableSkill copyWith(void Function(ShareableSkill) updates) => super.copyWith((message) => updates(message as ShareableSkill));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ShareableSkill create() => ShareableSkill._();
  ShareableSkill createEmptyInstance() => create();
  static $pb.PbList<ShareableSkill> createRepeated() => $pb.PbList<ShareableSkill>();
  @$core.pragma('dart2js:noInline')
  static ShareableSkill getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShareableSkill>(create);
  static ShareableSkill _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cost => $_getIZ(0);
  @$pb.TagNumber(1)
  set cost($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCost() => $_has(0);
  @$pb.TagNumber(1)
  void clearCost() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get idSkill => $_getIZ(1);
  @$pb.TagNumber(2)
  set idSkill($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdSkill() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdSkill() => clearField(2);

  @$pb.TagNumber(3)
  ShareableSkillFrom get from => $_getN(2);
  @$pb.TagNumber(3)
  set from(ShareableSkillFrom v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasFrom() => $_has(2);
  @$pb.TagNumber(3)
  void clearFrom() => clearField(3);
}

class Weapon extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Weapon', package: const $pb.PackageName('dragali'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..a<$core.int>(2, 'rarity', $pb.PbFieldType.OU3)
    ..e<ElementKind>(3, 'element', $pb.PbFieldType.OE, defaultOrMaker: ElementKind.NoElement, valueOf: ElementKind.valueOf, enumValues: ElementKind.values)
    ..e<WeaponKind>(4, 'weapon', $pb.PbFieldType.OE, defaultOrMaker: WeaponKind.NoWeapon, valueOf: WeaponKind.valueOf, enumValues: WeaponKind.values)
    ..a<$core.int>(5, 'idSkill', $pb.PbFieldType.OU3)
    ..aOS(11, 'image')
    ..hasRequiredFields = false
  ;

  Weapon._() : super();
  factory Weapon() => create();
  factory Weapon.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Weapon.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Weapon clone() => Weapon()..mergeFromMessage(this);
  Weapon copyWith(void Function(Weapon) updates) => super.copyWith((message) => updates(message as Weapon));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Weapon create() => Weapon._();
  Weapon createEmptyInstance() => create();
  static $pb.PbList<Weapon> createRepeated() => $pb.PbList<Weapon>();
  @$core.pragma('dart2js:noInline')
  static Weapon getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Weapon>(create);
  static Weapon _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rarity => $_getIZ(1);
  @$pb.TagNumber(2)
  set rarity($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRarity() => $_has(1);
  @$pb.TagNumber(2)
  void clearRarity() => clearField(2);

  @$pb.TagNumber(3)
  ElementKind get element => $_getN(2);
  @$pb.TagNumber(3)
  set element(ElementKind v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasElement() => $_has(2);
  @$pb.TagNumber(3)
  void clearElement() => clearField(3);

  @$pb.TagNumber(4)
  WeaponKind get weapon => $_getN(3);
  @$pb.TagNumber(4)
  set weapon(WeaponKind v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasWeapon() => $_has(3);
  @$pb.TagNumber(4)
  void clearWeapon() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get idSkill => $_getIZ(4);
  @$pb.TagNumber(5)
  set idSkill($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIdSkill() => $_has(4);
  @$pb.TagNumber(5)
  void clearIdSkill() => clearField(5);

  @$pb.TagNumber(11)
  $core.String get image => $_getSZ(5);
  @$pb.TagNumber(11)
  set image($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(11)
  $core.bool hasImage() => $_has(5);
  @$pb.TagNumber(11)
  void clearImage() => clearField(11);
}

class Dragon extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Dragon', package: const $pb.PackageName('dragali'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..a<$core.int>(2, 'rarity', $pb.PbFieldType.OU3)
    ..e<ElementKind>(3, 'element', $pb.PbFieldType.OE, defaultOrMaker: ElementKind.NoElement, valueOf: ElementKind.valueOf, enumValues: ElementKind.values)
    ..a<$core.int>(4, 'idSkill', $pb.PbFieldType.OU3)
    ..aOS(11, 'image')
    ..hasRequiredFields = false
  ;

  Dragon._() : super();
  factory Dragon() => create();
  factory Dragon.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Dragon.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Dragon clone() => Dragon()..mergeFromMessage(this);
  Dragon copyWith(void Function(Dragon) updates) => super.copyWith((message) => updates(message as Dragon));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Dragon create() => Dragon._();
  Dragon createEmptyInstance() => create();
  static $pb.PbList<Dragon> createRepeated() => $pb.PbList<Dragon>();
  @$core.pragma('dart2js:noInline')
  static Dragon getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Dragon>(create);
  static Dragon _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rarity => $_getIZ(1);
  @$pb.TagNumber(2)
  set rarity($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRarity() => $_has(1);
  @$pb.TagNumber(2)
  void clearRarity() => clearField(2);

  @$pb.TagNumber(3)
  ElementKind get element => $_getN(2);
  @$pb.TagNumber(3)
  set element(ElementKind v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasElement() => $_has(2);
  @$pb.TagNumber(3)
  void clearElement() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get idSkill => $_getIZ(3);
  @$pb.TagNumber(4)
  set idSkill($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIdSkill() => $_has(3);
  @$pb.TagNumber(4)
  void clearIdSkill() => clearField(4);

  @$pb.TagNumber(11)
  $core.String get image => $_getSZ(4);
  @$pb.TagNumber(11)
  set image($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(11)
  $core.bool hasImage() => $_has(4);
  @$pb.TagNumber(11)
  void clearImage() => clearField(11);
}

class Wyrmprint extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Wyrmprint', package: const $pb.PackageName('dragali'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..a<$core.int>(2, 'rarity', $pb.PbFieldType.OU3)
    ..e<AffinityKind>(3, 'affinity', $pb.PbFieldType.OE, defaultOrMaker: AffinityKind.NoAffinity, valueOf: AffinityKind.valueOf, enumValues: AffinityKind.values)
    ..aOS(11, 'image')
    ..a<$core.int>(21, 'idA11', $pb.PbFieldType.OU3)
    ..a<$core.int>(22, 'idA12', $pb.PbFieldType.OU3)
    ..a<$core.int>(23, 'idA13', $pb.PbFieldType.OU3)
    ..a<$core.int>(24, 'idA21', $pb.PbFieldType.OU3)
    ..a<$core.int>(25, 'idA22', $pb.PbFieldType.OU3)
    ..a<$core.int>(26, 'idA23', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  Wyrmprint._() : super();
  factory Wyrmprint() => create();
  factory Wyrmprint.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Wyrmprint.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Wyrmprint clone() => Wyrmprint()..mergeFromMessage(this);
  Wyrmprint copyWith(void Function(Wyrmprint) updates) => super.copyWith((message) => updates(message as Wyrmprint));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Wyrmprint create() => Wyrmprint._();
  Wyrmprint createEmptyInstance() => create();
  static $pb.PbList<Wyrmprint> createRepeated() => $pb.PbList<Wyrmprint>();
  @$core.pragma('dart2js:noInline')
  static Wyrmprint getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Wyrmprint>(create);
  static Wyrmprint _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get rarity => $_getIZ(1);
  @$pb.TagNumber(2)
  set rarity($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRarity() => $_has(1);
  @$pb.TagNumber(2)
  void clearRarity() => clearField(2);

  @$pb.TagNumber(3)
  AffinityKind get affinity => $_getN(2);
  @$pb.TagNumber(3)
  set affinity(AffinityKind v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAffinity() => $_has(2);
  @$pb.TagNumber(3)
  void clearAffinity() => clearField(3);

  @$pb.TagNumber(11)
  $core.String get image => $_getSZ(3);
  @$pb.TagNumber(11)
  set image($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(11)
  $core.bool hasImage() => $_has(3);
  @$pb.TagNumber(11)
  void clearImage() => clearField(11);

  @$pb.TagNumber(21)
  $core.int get idA11 => $_getIZ(4);
  @$pb.TagNumber(21)
  set idA11($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(21)
  $core.bool hasIdA11() => $_has(4);
  @$pb.TagNumber(21)
  void clearIdA11() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get idA12 => $_getIZ(5);
  @$pb.TagNumber(22)
  set idA12($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(22)
  $core.bool hasIdA12() => $_has(5);
  @$pb.TagNumber(22)
  void clearIdA12() => clearField(22);

  @$pb.TagNumber(23)
  $core.int get idA13 => $_getIZ(6);
  @$pb.TagNumber(23)
  set idA13($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(23)
  $core.bool hasIdA13() => $_has(6);
  @$pb.TagNumber(23)
  void clearIdA13() => clearField(23);

  @$pb.TagNumber(24)
  $core.int get idA21 => $_getIZ(7);
  @$pb.TagNumber(24)
  set idA21($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(24)
  $core.bool hasIdA21() => $_has(7);
  @$pb.TagNumber(24)
  void clearIdA21() => clearField(24);

  @$pb.TagNumber(25)
  $core.int get idA22 => $_getIZ(8);
  @$pb.TagNumber(25)
  set idA22($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(25)
  $core.bool hasIdA22() => $_has(8);
  @$pb.TagNumber(25)
  void clearIdA22() => clearField(25);

  @$pb.TagNumber(26)
  $core.int get idA23 => $_getIZ(9);
  @$pb.TagNumber(26)
  set idA23($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(26)
  $core.bool hasIdA23() => $_has(9);
  @$pb.TagNumber(26)
  void clearIdA23() => clearField(26);
}

class Ability extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('Ability', package: const $pb.PackageName('dragali'), createEmptyInstance: create)
    ..aOS(1, 'name')
    ..aOS(11, 'image')
    ..hasRequiredFields = false
  ;

  Ability._() : super();
  factory Ability() => create();
  factory Ability.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ability.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  Ability clone() => Ability()..mergeFromMessage(this);
  Ability copyWith(void Function(Ability) updates) => super.copyWith((message) => updates(message as Ability));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Ability create() => Ability._();
  Ability createEmptyInstance() => create();
  static $pb.PbList<Ability> createRepeated() => $pb.PbList<Ability>();
  @$core.pragma('dart2js:noInline')
  static Ability getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ability>(create);
  static Ability _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(11)
  $core.String get image => $_getSZ(1);
  @$pb.TagNumber(11)
  set image($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(11)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(11)
  void clearImage() => clearField(11);
}

class AbilityIcon extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AbilityIcon', package: const $pb.PackageName('dragali'), createEmptyInstance: create)
    ..aOS(1, 'image')
    ..hasRequiredFields = false
  ;

  AbilityIcon._() : super();
  factory AbilityIcon() => create();
  factory AbilityIcon.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AbilityIcon.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AbilityIcon clone() => AbilityIcon()..mergeFromMessage(this);
  AbilityIcon copyWith(void Function(AbilityIcon) updates) => super.copyWith((message) => updates(message as AbilityIcon));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AbilityIcon create() => AbilityIcon._();
  AbilityIcon createEmptyInstance() => create();
  static $pb.PbList<AbilityIcon> createRepeated() => $pb.PbList<AbilityIcon>();
  @$core.pragma('dart2js:noInline')
  static AbilityIcon getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AbilityIcon>(create);
  static AbilityIcon _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get image => $_getSZ(0);
  @$pb.TagNumber(1)
  set image($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasImage() => $_has(0);
  @$pb.TagNumber(1)
  void clearImage() => clearField(1);
}

class DragaliDataset extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DragaliDataset', package: const $pb.PackageName('dragali'), createEmptyInstance: create)
    ..m<$core.int, Adventurer>(2, 'Adventurers', protoName: 'Adventurers', entryClassName: 'DragaliDataset.AdventurersEntry', keyFieldType: $pb.PbFieldType.OU3, valueFieldType: $pb.PbFieldType.OM, valueCreator: Adventurer.create, packageName: const $pb.PackageName('dragali'))
    ..m<$core.int, Weapon>(3, 'Weapons', protoName: 'Weapons', entryClassName: 'DragaliDataset.WeaponsEntry', keyFieldType: $pb.PbFieldType.OU3, valueFieldType: $pb.PbFieldType.OM, valueCreator: Weapon.create, packageName: const $pb.PackageName('dragali'))
    ..m<$core.int, Dragon>(4, 'Dragons', protoName: 'Dragons', entryClassName: 'DragaliDataset.DragonsEntry', keyFieldType: $pb.PbFieldType.OU3, valueFieldType: $pb.PbFieldType.OM, valueCreator: Dragon.create, packageName: const $pb.PackageName('dragali'))
    ..m<$core.int, Wyrmprint>(5, 'Wyrmprints', protoName: 'Wyrmprints', entryClassName: 'DragaliDataset.WyrmprintsEntry', keyFieldType: $pb.PbFieldType.OU3, valueFieldType: $pb.PbFieldType.OM, valueCreator: Wyrmprint.create, packageName: const $pb.PackageName('dragali'))
    ..m<$core.int, Skill>(6, 'Skills', protoName: 'Skills', entryClassName: 'DragaliDataset.SkillsEntry', keyFieldType: $pb.PbFieldType.OU3, valueFieldType: $pb.PbFieldType.OM, valueCreator: Skill.create, packageName: const $pb.PackageName('dragali'))
    ..m<$core.int, ShareableSkill>(7, 'ShareableSkills', protoName: 'ShareableSkills', entryClassName: 'DragaliDataset.ShareableSkillsEntry', keyFieldType: $pb.PbFieldType.OU3, valueFieldType: $pb.PbFieldType.OM, valueCreator: ShareableSkill.create, packageName: const $pb.PackageName('dragali'))
    ..m<$core.int, Ability>(8, 'Abilities', protoName: 'Abilities', entryClassName: 'DragaliDataset.AbilitiesEntry', keyFieldType: $pb.PbFieldType.OU3, valueFieldType: $pb.PbFieldType.OM, valueCreator: Ability.create, packageName: const $pb.PackageName('dragali'))
    ..pc<AbilityIcon>(9, 'AbilityIcons', $pb.PbFieldType.PM, protoName: 'AbilityIcons', subBuilder: AbilityIcon.create)
    ..hasRequiredFields = false
  ;

  DragaliDataset._() : super();
  factory DragaliDataset() => create();
  factory DragaliDataset.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DragaliDataset.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DragaliDataset clone() => DragaliDataset()..mergeFromMessage(this);
  DragaliDataset copyWith(void Function(DragaliDataset) updates) => super.copyWith((message) => updates(message as DragaliDataset));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DragaliDataset create() => DragaliDataset._();
  DragaliDataset createEmptyInstance() => create();
  static $pb.PbList<DragaliDataset> createRepeated() => $pb.PbList<DragaliDataset>();
  @$core.pragma('dart2js:noInline')
  static DragaliDataset getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DragaliDataset>(create);
  static DragaliDataset _defaultInstance;

  @$pb.TagNumber(2)
  $core.Map<$core.int, Adventurer> get adventurers => $_getMap(0);

  @$pb.TagNumber(3)
  $core.Map<$core.int, Weapon> get weapons => $_getMap(1);

  @$pb.TagNumber(4)
  $core.Map<$core.int, Dragon> get dragons => $_getMap(2);

  @$pb.TagNumber(5)
  $core.Map<$core.int, Wyrmprint> get wyrmprints => $_getMap(3);

  @$pb.TagNumber(6)
  $core.Map<$core.int, Skill> get skills => $_getMap(4);

  @$pb.TagNumber(7)
  $core.Map<$core.int, ShareableSkill> get shareableSkills => $_getMap(5);

  @$pb.TagNumber(8)
  $core.Map<$core.int, Ability> get abilities => $_getMap(6);

  @$pb.TagNumber(9)
  $core.List<AbilityIcon> get abilityIcons => $_getList(7);
}

class AdventurerSetup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AdventurerSetup', package: const $pb.PackageName('dragali'), createEmptyInstance: create)
    ..a<$core.int>(1, 'idAdventurer', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, 'idWeapon', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, 'idDragon', $pb.PbFieldType.OU3)
    ..a<$core.int>(11, 'idPrintA1', $pb.PbFieldType.OU3, protoName: 'id_print_a_1')
    ..a<$core.int>(12, 'idPrintA2', $pb.PbFieldType.OU3, protoName: 'id_print_a_2')
    ..a<$core.int>(13, 'idPrintA3', $pb.PbFieldType.OU3, protoName: 'id_print_a_3')
    ..a<$core.int>(14, 'idPrintB1', $pb.PbFieldType.OU3, protoName: 'id_print_b_1')
    ..a<$core.int>(15, 'idPrintB2', $pb.PbFieldType.OU3, protoName: 'id_print_b_2')
    ..a<$core.int>(21, 'idAdventurerSs1', $pb.PbFieldType.OU3, protoName: 'id_adventurer_ss_1')
    ..a<$core.int>(22, 'idAdventurerSs2', $pb.PbFieldType.OU3, protoName: 'id_adventurer_ss_2')
    ..a<$core.int>(31, 'idEx2', $pb.PbFieldType.OU3, protoName: 'id_ex_2')
    ..a<$core.int>(32, 'idEx3', $pb.PbFieldType.OU3, protoName: 'id_ex_3')
    ..a<$core.int>(33, 'idEx4', $pb.PbFieldType.OU3, protoName: 'id_ex_4')
    ..hasRequiredFields = false
  ;

  AdventurerSetup._() : super();
  factory AdventurerSetup() => create();
  factory AdventurerSetup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdventurerSetup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AdventurerSetup clone() => AdventurerSetup()..mergeFromMessage(this);
  AdventurerSetup copyWith(void Function(AdventurerSetup) updates) => super.copyWith((message) => updates(message as AdventurerSetup));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AdventurerSetup create() => AdventurerSetup._();
  AdventurerSetup createEmptyInstance() => create();
  static $pb.PbList<AdventurerSetup> createRepeated() => $pb.PbList<AdventurerSetup>();
  @$core.pragma('dart2js:noInline')
  static AdventurerSetup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdventurerSetup>(create);
  static AdventurerSetup _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get idAdventurer => $_getIZ(0);
  @$pb.TagNumber(1)
  set idAdventurer($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIdAdventurer() => $_has(0);
  @$pb.TagNumber(1)
  void clearIdAdventurer() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get idWeapon => $_getIZ(1);
  @$pb.TagNumber(2)
  set idWeapon($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIdWeapon() => $_has(1);
  @$pb.TagNumber(2)
  void clearIdWeapon() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get idDragon => $_getIZ(2);
  @$pb.TagNumber(3)
  set idDragon($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIdDragon() => $_has(2);
  @$pb.TagNumber(3)
  void clearIdDragon() => clearField(3);

  @$pb.TagNumber(11)
  $core.int get idPrintA1 => $_getIZ(3);
  @$pb.TagNumber(11)
  set idPrintA1($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(11)
  $core.bool hasIdPrintA1() => $_has(3);
  @$pb.TagNumber(11)
  void clearIdPrintA1() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get idPrintA2 => $_getIZ(4);
  @$pb.TagNumber(12)
  set idPrintA2($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(12)
  $core.bool hasIdPrintA2() => $_has(4);
  @$pb.TagNumber(12)
  void clearIdPrintA2() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get idPrintA3 => $_getIZ(5);
  @$pb.TagNumber(13)
  set idPrintA3($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(13)
  $core.bool hasIdPrintA3() => $_has(5);
  @$pb.TagNumber(13)
  void clearIdPrintA3() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get idPrintB1 => $_getIZ(6);
  @$pb.TagNumber(14)
  set idPrintB1($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(14)
  $core.bool hasIdPrintB1() => $_has(6);
  @$pb.TagNumber(14)
  void clearIdPrintB1() => clearField(14);

  @$pb.TagNumber(15)
  $core.int get idPrintB2 => $_getIZ(7);
  @$pb.TagNumber(15)
  set idPrintB2($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(15)
  $core.bool hasIdPrintB2() => $_has(7);
  @$pb.TagNumber(15)
  void clearIdPrintB2() => clearField(15);

  @$pb.TagNumber(21)
  $core.int get idAdventurerSs1 => $_getIZ(8);
  @$pb.TagNumber(21)
  set idAdventurerSs1($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(21)
  $core.bool hasIdAdventurerSs1() => $_has(8);
  @$pb.TagNumber(21)
  void clearIdAdventurerSs1() => clearField(21);

  @$pb.TagNumber(22)
  $core.int get idAdventurerSs2 => $_getIZ(9);
  @$pb.TagNumber(22)
  set idAdventurerSs2($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(22)
  $core.bool hasIdAdventurerSs2() => $_has(9);
  @$pb.TagNumber(22)
  void clearIdAdventurerSs2() => clearField(22);

  @$pb.TagNumber(31)
  $core.int get idEx2 => $_getIZ(10);
  @$pb.TagNumber(31)
  set idEx2($core.int v) { $_setUnsignedInt32(10, v); }
  @$pb.TagNumber(31)
  $core.bool hasIdEx2() => $_has(10);
  @$pb.TagNumber(31)
  void clearIdEx2() => clearField(31);

  @$pb.TagNumber(32)
  $core.int get idEx3 => $_getIZ(11);
  @$pb.TagNumber(32)
  set idEx3($core.int v) { $_setUnsignedInt32(11, v); }
  @$pb.TagNumber(32)
  $core.bool hasIdEx3() => $_has(11);
  @$pb.TagNumber(32)
  void clearIdEx3() => clearField(32);

  @$pb.TagNumber(33)
  $core.int get idEx4 => $_getIZ(12);
  @$pb.TagNumber(33)
  set idEx4($core.int v) { $_setUnsignedInt32(12, v); }
  @$pb.TagNumber(33)
  $core.bool hasIdEx4() => $_has(12);
  @$pb.TagNumber(33)
  void clearIdEx4() => clearField(33);
}

class TeamSetup extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('TeamSetup', package: const $pb.PackageName('dragali'), createEmptyInstance: create)
    ..aOM<AdventurerSetup>(1, 'Adventurer1', protoName: 'Adventurer_1', subBuilder: AdventurerSetup.create)
    ..aOM<AdventurerSetup>(2, 'Adventurer2', protoName: 'Adventurer_2', subBuilder: AdventurerSetup.create)
    ..aOM<AdventurerSetup>(3, 'Adventurer3', protoName: 'Adventurer_3', subBuilder: AdventurerSetup.create)
    ..aOM<AdventurerSetup>(4, 'Adventurer4', protoName: 'Adventurer_4', subBuilder: AdventurerSetup.create)
    ..aOB(5, 'Coop', protoName: 'Coop')
    ..hasRequiredFields = false
  ;

  TeamSetup._() : super();
  factory TeamSetup() => create();
  factory TeamSetup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TeamSetup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  TeamSetup clone() => TeamSetup()..mergeFromMessage(this);
  TeamSetup copyWith(void Function(TeamSetup) updates) => super.copyWith((message) => updates(message as TeamSetup));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static TeamSetup create() => TeamSetup._();
  TeamSetup createEmptyInstance() => create();
  static $pb.PbList<TeamSetup> createRepeated() => $pb.PbList<TeamSetup>();
  @$core.pragma('dart2js:noInline')
  static TeamSetup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TeamSetup>(create);
  static TeamSetup _defaultInstance;

  @$pb.TagNumber(1)
  AdventurerSetup get adventurer1 => $_getN(0);
  @$pb.TagNumber(1)
  set adventurer1(AdventurerSetup v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAdventurer1() => $_has(0);
  @$pb.TagNumber(1)
  void clearAdventurer1() => clearField(1);
  @$pb.TagNumber(1)
  AdventurerSetup ensureAdventurer1() => $_ensure(0);

  @$pb.TagNumber(2)
  AdventurerSetup get adventurer2 => $_getN(1);
  @$pb.TagNumber(2)
  set adventurer2(AdventurerSetup v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasAdventurer2() => $_has(1);
  @$pb.TagNumber(2)
  void clearAdventurer2() => clearField(2);
  @$pb.TagNumber(2)
  AdventurerSetup ensureAdventurer2() => $_ensure(1);

  @$pb.TagNumber(3)
  AdventurerSetup get adventurer3 => $_getN(2);
  @$pb.TagNumber(3)
  set adventurer3(AdventurerSetup v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasAdventurer3() => $_has(2);
  @$pb.TagNumber(3)
  void clearAdventurer3() => clearField(3);
  @$pb.TagNumber(3)
  AdventurerSetup ensureAdventurer3() => $_ensure(2);

  @$pb.TagNumber(4)
  AdventurerSetup get adventurer4 => $_getN(3);
  @$pb.TagNumber(4)
  set adventurer4(AdventurerSetup v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAdventurer4() => $_has(3);
  @$pb.TagNumber(4)
  void clearAdventurer4() => clearField(4);
  @$pb.TagNumber(4)
  AdventurerSetup ensureAdventurer4() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.bool get coop => $_getBF(4);
  @$pb.TagNumber(5)
  set coop($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCoop() => $_has(4);
  @$pb.TagNumber(5)
  void clearCoop() => clearField(5);
}

