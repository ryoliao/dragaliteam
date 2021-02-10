import 'package:dragaliteam/proto/dragali.pb.dart' as pb;
import 'package:flutter/material.dart';

import '../DragaliIcons.dart';
import '../util.dart';
import 'ShapeToggleButton.dart';

class AffinitySelection {
  int flags;

  AffinitySelection([this.flags = 0]);

  static const int crownFlag = 1 << 0;
  static const int axeFlag = 1 << 1;
  static const int swordFlag = 1 << 2;
  static const int bowFlag = 1 << 3;
  static const int dragonFlag = 1 << 4;
  static const int lanceFlag = 1 << 5;
  static const int eagleFlag = 1 << 6;
  static const int wolfFlag = 1 << 7;
  static const int bullFlag = 1 << 8;
  static const int serpentFlag = 1 << 9;
  static const int staffFlag = 1 << 10;

  static const int allFlag = crownFlag |
      axeFlag |
      swordFlag |
      bowFlag |
      dragonFlag |
      lanceFlag |
      eagleFlag |
      wolfFlag |
      bullFlag |
      serpentFlag |
      staffFlag;

  static int flagOf(pb.AffinityKind e) => 1 << (e.value - 1);

  bool has(pb.AffinityKind e) {
    if (e == pb.AffinityKind.NoAffinity) {
      return all;
    }
    return hasAllFlag(flags, flagOf(e));
  }

  bool get all => hasAllFlag(flags, allFlag) || !hasAnyFlag(flags, allFlag);

  AffinitySelection clone() => AffinitySelection(flags);
}

class AffinityFilter extends StatefulWidget {
  final Function(AffinitySelection) onChanged;
  final Axis direction;
  final double buttonSize;
  final AffinitySelection initialSelection;

  AffinityFilter(
      {@required this.onChanged,
      this.buttonSize = 24,
      this.direction = Axis.horizontal,
      this.initialSelection});

  @override
  State<StatefulWidget> createState() => AffinityFilterState();
}

class AffinityFilterState extends State<AffinityFilter> {
  AffinitySelection _sel;

  Widget _buildButton(BuildContext context, pb.AffinityKind e) {
    return SizedBox(
        width: widget.buttonSize,
        height: widget.buttonSize,
        child: ShapeToggleButton(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          state: _sel.has(e),
          child: Image(
            image: DragaliIcons.affinity(e),
          ),
          onTap: () {
            var newSel = _sel.clone();
            newSel.flags =
                switchFlag(newSel.flags, AffinitySelection.flagOf(e));
            setState(() {
              _sel.flags = newSel.flags;
            });
            widget.onChanged?.call(newSel);
          },
        ));
  }

  @override
  void initState() {
    super.initState();
    _sel = widget.initialSelection?.clone() ?? AffinitySelection();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        ...pb.AffinityKind.values.skip(1).map((e) => _buildButton(context, e)),
      ],
    );
  }
}
