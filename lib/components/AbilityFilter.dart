import 'package:dragaliteam/DataCenter.dart';
import 'package:flutter/material.dart';

import '../DragaliIcons.dart';
import 'ShapeToggleButton.dart';

class AbilitySelection {
  final Map<String, bool> selections;
  int _setCount;

  AbilitySelection._()
      : selections = Map.fromEntries(
          DataCenter.instance.abilityIcons.map(
            (i) => MapEntry(i.image, false),
          ),
        ),
        _setCount = 0;

  AbilitySelection._assign(this.selections, this._setCount);

  factory AbilitySelection.create() => AbilitySelection._();

  bool has(String icon) => selections[icon] ?? false;
  bool get all => _setCount == 0 || _setCount == selections.length;

  void switchState(String icon) {
    var value = selections[icon];
    if (value != null) {
      value ^= true;
      selections[icon] = value;
      _setCount += value ? 1 : -1;
    }
  }

  AbilitySelection clone() => AbilitySelection._assign(
        {...selections},
        _setCount,
      );
}

class AbilityFilter extends StatefulWidget {
  final Function(AbilitySelection) onChanged;
  final double buttonSize;

  AbilityFilter({
    @required this.onChanged,
    this.buttonSize = 24,
  });

  @override
  State<StatefulWidget> createState() => AbilityFilterState();
}

class AbilityFilterState extends State<AbilityFilter> {
  AbilitySelection _selAbility;
  List<String> _items;

  @override
  void initState() {
    super.initState();
    _selAbility = AbilitySelection.create();
    _items = DataCenter.instance.abilityIcons
        .map(
          (icon) => icon.image,
        )
        .toList();
  }

  Widget _buildWidget(BuildContext context, int index) {
    var icon = _items[index];
    return SizedBox(
      width: widget.buttonSize,
      height: widget.buttonSize,
      child: ShapeToggleButton(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        state: _selAbility.has(icon),
        child: Image(
          image: DragaliIcons.ability(icon),
        ),
        onTap: () {
          var selNew = _selAbility.clone();
          selNew.switchState(icon);
          setState(() {
            _selAbility = selNew;
          });
          widget.onChanged?.call(selNew);
        },
      ),
    );
  }

  Iterable<Widget> _buildAllWidgets(BuildContext context) sync* {
    for (int i = 0; i < _items.length; ++i) {
      yield _buildWidget(context, i);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.buttonSize,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ..._buildAllWidgets(context),
          ],
        ),
      ),
    );
  }
}
