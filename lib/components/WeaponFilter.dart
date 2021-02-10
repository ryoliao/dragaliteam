import 'package:dragaliteam/proto/dragali.pb.dart' as pb;
import 'package:flutter/material.dart';

import '../DragaliIcons.dart';
import '../util.dart';
import 'ShapeToggleButton.dart';

class WeaponSelection {
  int flags;

  WeaponSelection([this.flags = 0]);

  static const int swordFlag = 1 << 0;
  static const int bladeFlag = 1 << 1;
  static const int daggerFlag = 1 << 2;
  static const int axeFlag = 1 << 3;
  static const int lanceFlag = 1 << 4;
  static const int bowFlag = 1 << 5;
  static const int wandFlag = 1 << 6;
  static const int staffFlag = 1 << 7;
  static const int manacasterFlag = 1 << 8;

  static const flagNames = <int, String>{
    swordFlag: 'Sword',
    bladeFlag: 'Blade',
    daggerFlag: 'Dagger',
    axeFlag: 'Axe',
    lanceFlag: 'Lance',
    bowFlag: 'Bow',
    wandFlag: 'Wand',
    staffFlag: 'Staff',
    manacasterFlag: 'Manacaster',
  };

  static const int allFlag = swordFlag |
      bladeFlag |
      daggerFlag |
      axeFlag |
      lanceFlag |
      bowFlag |
      wandFlag |
      staffFlag |
      manacasterFlag;

  bool has(pb.WeaponKind e) {
    switch (e) {
      case pb.WeaponKind.Sword:
        return sword;
      case pb.WeaponKind.Blade:
        return blade;
      case pb.WeaponKind.Dagger:
        return dagger;
      case pb.WeaponKind.Axe:
        return axe;
      case pb.WeaponKind.Lance:
        return lance;
      case pb.WeaponKind.Bow:
        return bow;
      case pb.WeaponKind.Wand:
        return wand;
      case pb.WeaponKind.Staff:
        return staff;
      case pb.WeaponKind.Manacaster:
        return manacaster;
      default:
        assert(false);
        return false;
    }
  }

  bool get sword => hasAllFlag(flags, swordFlag);
  set sword(bool state) => flags = setFlag(flags, swordFlag);

  bool get blade => hasAllFlag(flags, bladeFlag);
  set blade(bool state) => flags = setFlag(flags, bladeFlag);

  bool get dagger => hasAllFlag(flags, daggerFlag);
  set dagger(bool state) => flags = setFlag(flags, daggerFlag);

  bool get axe => hasAllFlag(flags, axeFlag);
  set axe(bool state) => flags = setFlag(flags, axeFlag);

  bool get lance => hasAllFlag(flags, lanceFlag);
  set lance(bool state) => flags = setFlag(flags, lanceFlag);

  bool get bow => hasAllFlag(flags, bowFlag);
  set bow(bool state) => flags = setFlag(flags, bowFlag);

  bool get wand => hasAllFlag(flags, wandFlag);
  set wand(bool state) => flags = setFlag(flags, wandFlag);

  bool get staff => hasAllFlag(flags, staffFlag);
  set staff(bool state) => flags = setFlag(flags, staffFlag);

  bool get manacaster => hasAllFlag(flags, manacasterFlag);
  set manacaster(bool state) => flags = setFlag(flags, manacasterFlag);

  bool get all => hasAllFlag(flags, allFlag) || !hasAnyFlag(flags, allFlag);
  void resetAll() => flags = 0;

  WeaponSelection clone() => WeaponSelection(flags);
}

class WeaponFilter extends StatefulWidget {
  final Function(WeaponSelection) onChanged;
  final Axis direction;
  final double buttonSize;
  final WeaponSelection initialSelection;

  WeaponFilter(
      {@required this.onChanged,
      this.buttonSize = 24,
      this.direction = Axis.horizontal,
      this.initialSelection});

  @override
  State<StatefulWidget> createState() => WeaponFilterState();
}

class WeaponFilterState extends State<WeaponFilter> {
  WeaponSelection _sel;

  Widget buildButton(BuildContext context, String weaponName, int flag) {
    return ShapeToggleButton(
      state: hasAllFlag(_sel.flags, flag),
      child: Image(
        image: DragaliIcons.weaponClass(weaponName),
      ),
      onTap: () {
        var newSel = _sel.clone();
        newSel.flags = switchFlag(newSel.flags, flag);
        setState(() {
          _sel.flags = newSel.flags;
        });
        widget.onChanged?.call(newSel);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _sel = widget.initialSelection?.clone() ?? WeaponSelection();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.buttonSize,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ...WeaponSelection.flagNames.entries
              .map((e) => buildButton(context, e.value, e.key)),
        ],
      ),
    );
  }
}
