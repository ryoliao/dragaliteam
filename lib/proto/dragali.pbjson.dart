///
//  Generated code. Do not modify.
//  source: dragali.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const ElementKind$json = const {
  '1': 'ElementKind',
  '2': const [
    const {'1': 'NoElement', '2': 0},
    const {'1': 'Flame', '2': 1},
    const {'1': 'Water', '2': 2},
    const {'1': 'Wind', '2': 3},
    const {'1': 'Light', '2': 4},
    const {'1': 'Shadow', '2': 5},
  ],
};

const WeaponKind$json = const {
  '1': 'WeaponKind',
  '2': const [
    const {'1': 'NoWeapon', '2': 0},
    const {'1': 'Sword', '2': 1},
    const {'1': 'Blade', '2': 2},
    const {'1': 'Dagger', '2': 3},
    const {'1': 'Axe', '2': 4},
    const {'1': 'Lance', '2': 5},
    const {'1': 'Bow', '2': 6},
    const {'1': 'Wand', '2': 7},
    const {'1': 'Staff', '2': 8},
    const {'1': 'Manacaster', '2': 9},
  ],
};

const AffinityKind$json = const {
  '1': 'AffinityKind',
  '2': const [
    const {'1': 'NoAffinity', '2': 0},
    const {'1': 'CrownsBoon', '2': 1},
    const {'1': 'AxesBoon', '2': 2},
    const {'1': 'SwordsBoon', '2': 3},
    const {'1': 'BowsBoon', '2': 4},
    const {'1': 'DragonsBoon', '2': 5},
    const {'1': 'LancesBoon', '2': 6},
    const {'1': 'EaglesBoon', '2': 7},
    const {'1': 'WolfsBoon', '2': 8},
    const {'1': 'BullsBoon', '2': 9},
    const {'1': 'SerpentsBoon', '2': 10},
    const {'1': 'StaffsBoon', '2': 11},
  ],
};

const AdventurerClass$json = const {
  '1': 'AdventurerClass',
  '2': const [
    const {'1': 'NoAdventurerClass', '2': 0},
    const {'1': 'Attack', '2': 1},
    const {'1': 'Defense', '2': 2},
    const {'1': 'Healing', '2': 3},
    const {'1': 'Support', '2': 4},
  ],
};

const ShareableSkillFrom$json = const {
  '1': 'ShareableSkillFrom',
  '2': const [
    const {'1': 'NoShareableSkillType', '2': 0},
    const {'1': 'SkillFromDragon', '2': 1},
    const {'1': 'SkillFromWeapon', '2': 2},
    const {'1': 'SkillFromAdventurer', '2': 3},
  ],
};

const Skill$json = const {
  '1': 'Skill',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'image', '3': 11, '4': 1, '5': 9, '10': 'image'},
  ],
};

const Adventurer$json = const {
  '1': 'Adventurer',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'rarity', '3': 2, '4': 1, '5': 13, '10': 'rarity'},
    const {'1': 'element', '3': 3, '4': 1, '5': 14, '6': '.dragali.ElementKind', '10': 'element'},
    const {'1': 'weapon', '3': 4, '4': 1, '5': 14, '6': '.dragali.WeaponKind', '10': 'weapon'},
    const {'1': 'klass', '3': 5, '4': 1, '5': 14, '6': '.dragali.AdventurerClass', '10': 'klass'},
    const {'1': 'id_skill_1', '3': 6, '4': 1, '5': 13, '10': 'idSkill1'},
    const {'1': 'id_skill_2', '3': 7, '4': 1, '5': 13, '10': 'idSkill2'},
    const {'1': 'id_co_ability', '3': 8, '4': 1, '5': 13, '10': 'idCoAbility'},
    const {'1': 'id_chain_co_ability', '3': 9, '4': 1, '5': 13, '10': 'idChainCoAbility'},
    const {'1': 'image', '3': 11, '4': 1, '5': 9, '10': 'image'},
  ],
};

const ShareableSkill$json = const {
  '1': 'ShareableSkill',
  '2': const [
    const {'1': 'cost', '3': 1, '4': 1, '5': 13, '10': 'cost'},
    const {'1': 'id_skill', '3': 2, '4': 1, '5': 13, '10': 'idSkill'},
    const {'1': 'from', '3': 3, '4': 1, '5': 14, '6': '.dragali.ShareableSkillFrom', '10': 'from'},
  ],
};

const Weapon$json = const {
  '1': 'Weapon',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'rarity', '3': 2, '4': 1, '5': 13, '10': 'rarity'},
    const {'1': 'element', '3': 3, '4': 1, '5': 14, '6': '.dragali.ElementKind', '10': 'element'},
    const {'1': 'weapon', '3': 4, '4': 1, '5': 14, '6': '.dragali.WeaponKind', '10': 'weapon'},
    const {'1': 'id_skill', '3': 5, '4': 1, '5': 13, '10': 'idSkill'},
    const {'1': 'image', '3': 11, '4': 1, '5': 9, '10': 'image'},
  ],
};

const Dragon$json = const {
  '1': 'Dragon',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'rarity', '3': 2, '4': 1, '5': 13, '10': 'rarity'},
    const {'1': 'element', '3': 3, '4': 1, '5': 14, '6': '.dragali.ElementKind', '10': 'element'},
    const {'1': 'id_skill', '3': 4, '4': 1, '5': 13, '10': 'idSkill'},
    const {'1': 'image', '3': 11, '4': 1, '5': 9, '10': 'image'},
  ],
};

const Wyrmprint$json = const {
  '1': 'Wyrmprint',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'rarity', '3': 2, '4': 1, '5': 13, '10': 'rarity'},
    const {'1': 'affinity', '3': 3, '4': 1, '5': 14, '6': '.dragali.AffinityKind', '10': 'affinity'},
    const {'1': 'id_a11', '3': 21, '4': 1, '5': 13, '10': 'idA11'},
    const {'1': 'id_a12', '3': 22, '4': 1, '5': 13, '10': 'idA12'},
    const {'1': 'id_a13', '3': 23, '4': 1, '5': 13, '10': 'idA13'},
    const {'1': 'id_a21', '3': 24, '4': 1, '5': 13, '10': 'idA21'},
    const {'1': 'id_a22', '3': 25, '4': 1, '5': 13, '10': 'idA22'},
    const {'1': 'id_a23', '3': 26, '4': 1, '5': 13, '10': 'idA23'},
    const {'1': 'image', '3': 11, '4': 1, '5': 9, '10': 'image'},
  ],
};

const Ability$json = const {
  '1': 'Ability',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'image', '3': 11, '4': 1, '5': 9, '10': 'image'},
  ],
};

const AbilityIcon$json = const {
  '1': 'AbilityIcon',
  '2': const [
    const {'1': 'image', '3': 1, '4': 1, '5': 9, '10': 'image'},
  ],
};

const DragaliDataset$json = const {
  '1': 'DragaliDataset',
  '2': const [
    const {'1': 'Adventurers', '3': 2, '4': 3, '5': 11, '6': '.dragali.DragaliDataset.AdventurersEntry', '10': 'Adventurers'},
    const {'1': 'Weapons', '3': 3, '4': 3, '5': 11, '6': '.dragali.DragaliDataset.WeaponsEntry', '10': 'Weapons'},
    const {'1': 'Dragons', '3': 4, '4': 3, '5': 11, '6': '.dragali.DragaliDataset.DragonsEntry', '10': 'Dragons'},
    const {'1': 'Wyrmprints', '3': 5, '4': 3, '5': 11, '6': '.dragali.DragaliDataset.WyrmprintsEntry', '10': 'Wyrmprints'},
    const {'1': 'Skills', '3': 6, '4': 3, '5': 11, '6': '.dragali.DragaliDataset.SkillsEntry', '10': 'Skills'},
    const {'1': 'ShareableSkills', '3': 7, '4': 3, '5': 11, '6': '.dragali.DragaliDataset.ShareableSkillsEntry', '10': 'ShareableSkills'},
    const {'1': 'Abilities', '3': 8, '4': 3, '5': 11, '6': '.dragali.DragaliDataset.AbilitiesEntry', '10': 'Abilities'},
    const {'1': 'AbilityIcons', '3': 9, '4': 3, '5': 11, '6': '.dragali.AbilityIcon', '10': 'AbilityIcons'},
  ],
  '3': const [DragaliDataset_AdventurersEntry$json, DragaliDataset_WeaponsEntry$json, DragaliDataset_DragonsEntry$json, DragaliDataset_WyrmprintsEntry$json, DragaliDataset_SkillsEntry$json, DragaliDataset_ShareableSkillsEntry$json, DragaliDataset_AbilitiesEntry$json],
};

const DragaliDataset_AdventurersEntry$json = const {
  '1': 'AdventurersEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 13, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.dragali.Adventurer', '10': 'value'},
  ],
  '7': const {'7': true},
};

const DragaliDataset_WeaponsEntry$json = const {
  '1': 'WeaponsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 13, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.dragali.Weapon', '10': 'value'},
  ],
  '7': const {'7': true},
};

const DragaliDataset_DragonsEntry$json = const {
  '1': 'DragonsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 13, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.dragali.Dragon', '10': 'value'},
  ],
  '7': const {'7': true},
};

const DragaliDataset_WyrmprintsEntry$json = const {
  '1': 'WyrmprintsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 13, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.dragali.Wyrmprint', '10': 'value'},
  ],
  '7': const {'7': true},
};

const DragaliDataset_SkillsEntry$json = const {
  '1': 'SkillsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 13, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.dragali.Skill', '10': 'value'},
  ],
  '7': const {'7': true},
};

const DragaliDataset_ShareableSkillsEntry$json = const {
  '1': 'ShareableSkillsEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 13, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.dragali.ShareableSkill', '10': 'value'},
  ],
  '7': const {'7': true},
};

const DragaliDataset_AbilitiesEntry$json = const {
  '1': 'AbilitiesEntry',
  '2': const [
    const {'1': 'key', '3': 1, '4': 1, '5': 13, '10': 'key'},
    const {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.dragali.Ability', '10': 'value'},
  ],
  '7': const {'7': true},
};

const AdventurerSetup$json = const {
  '1': 'AdventurerSetup',
  '2': const [
    const {'1': 'id_adventurer', '3': 1, '4': 1, '5': 13, '10': 'idAdventurer'},
    const {'1': 'id_weapon', '3': 2, '4': 1, '5': 13, '10': 'idWeapon'},
    const {'1': 'id_dragon', '3': 3, '4': 1, '5': 13, '10': 'idDragon'},
    const {'1': 'id_print_a_1', '3': 11, '4': 1, '5': 13, '10': 'idPrintA1'},
    const {'1': 'id_print_a_2', '3': 12, '4': 1, '5': 13, '10': 'idPrintA2'},
    const {'1': 'id_print_a_3', '3': 13, '4': 1, '5': 13, '10': 'idPrintA3'},
    const {'1': 'id_print_b_1', '3': 14, '4': 1, '5': 13, '10': 'idPrintB1'},
    const {'1': 'id_print_b_2', '3': 15, '4': 1, '5': 13, '10': 'idPrintB2'},
    const {'1': 'id_adventurer_ss_1', '3': 21, '4': 1, '5': 13, '10': 'idAdventurerSs1'},
    const {'1': 'id_adventurer_ss_2', '3': 22, '4': 1, '5': 13, '10': 'idAdventurerSs2'},
    const {'1': 'id_ex_2', '3': 31, '4': 1, '5': 13, '10': 'idEx2'},
    const {'1': 'id_ex_3', '3': 32, '4': 1, '5': 13, '10': 'idEx3'},
    const {'1': 'id_ex_4', '3': 33, '4': 1, '5': 13, '10': 'idEx4'},
  ],
};

const TeamSetup$json = const {
  '1': 'TeamSetup',
  '2': const [
    const {'1': 'Adventurer_1', '3': 1, '4': 1, '5': 11, '6': '.dragali.AdventurerSetup', '10': 'Adventurer1'},
    const {'1': 'Adventurer_2', '3': 2, '4': 1, '5': 11, '6': '.dragali.AdventurerSetup', '10': 'Adventurer2'},
    const {'1': 'Adventurer_3', '3': 3, '4': 1, '5': 11, '6': '.dragali.AdventurerSetup', '10': 'Adventurer3'},
    const {'1': 'Adventurer_4', '3': 4, '4': 1, '5': 11, '6': '.dragali.AdventurerSetup', '10': 'Adventurer4'},
    const {'1': 'Coop', '3': 5, '4': 1, '5': 8, '10': 'Coop'},
  ],
};

