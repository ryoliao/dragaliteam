import 'package:flutter/material.dart';
import '../DragaliIcons.dart';
import 'dart:core';
import '../util.dart';
import 'ShapeToggleButton.dart';

class RaritySelection {
  int flags;

  RaritySelection([this.flags = 0]);

  static int flag(int rarity) => 1 << (rarity - 1);
  bool has(int rarity) => hasAllFlag(flags, flag(rarity));

  bool all(int min, int max) {
    int allFlags = ((1 << ((max - min) + 1)) - 1) << (min - 1);
    return !hasAnyFlag(flags, allFlags) || hasAllFlag(flags, allFlags);
  }

  RaritySelection clone() => RaritySelection(flags);
}

class RarityFilter extends StatefulWidget {
  final Function(RaritySelection) onChanged;
  final double buttonSize;
  final int minRarity;
  final int maxRarity;
  final RaritySelection initialSelection;

  RarityFilter({
    this.minRarity = 3,
    this.maxRarity = 6,
    @required this.onChanged,
    this.buttonSize = 24,
    this.initialSelection,
  });

  @override
  State<StatefulWidget> createState() => RarityFilterState();
}

class RarityFilterState extends State<RarityFilter> {
  RaritySelection _sel;

  Iterable<Widget> buildButtons(BuildContext context) sync* {
    for (int i = widget.minRarity; i <= widget.maxRarity; ++i) {
      yield SizedBox(
        width: widget.buttonSize,
        height: widget.buttonSize,
        child: ShapeToggleButton(
          state: _sel.has(i),
          child: Image(
            image: DragaliIcons.rarity(i),
          ),
          onTap: () {
            var newSel = _sel.clone();
            newSel.flags = switchFlag(newSel.flags, RaritySelection.flag(i));
            setState(() {
              _sel.flags = newSel.flags;
            });
            widget.onChanged?.call(newSel);
          },
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _sel = widget.initialSelection?.clone() ?? RaritySelection();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ...buildButtons(context),
      ],
    );
  }
}
