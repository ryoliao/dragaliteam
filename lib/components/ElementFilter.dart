import 'package:dragaliteam/proto/dragali.pb.dart' as pb;
import 'package:flutter/material.dart';

import '../DragaliIcons.dart';
import '../util.dart';
import 'ShapeToggleButton.dart';

class ElementSelection {
  int flags;

  ElementSelection([this.flags = 0]);

  static const int flameFlag = 1 << 0;
  static const int waterFlag = 1 << 1;
  static const int windFlag = 1 << 2;
  static const int lightFlag = 1 << 3;
  static const int shadowFlag = 1 << 4;
  static const int noneFlag = 1 << 5;
  static const int elementalFlag =
      flameFlag | waterFlag | windFlag | lightFlag | shadowFlag;
  static const int allFlag = elementalFlag | noneFlag;

  bool has(pb.ElementKind e) {
    switch (e) {
      case pb.ElementKind.Flame:
        return flame;
      case pb.ElementKind.Water:
        return water;
      case pb.ElementKind.Wind:
        return wind;
      case pb.ElementKind.Light:
        return light;
      case pb.ElementKind.Shadow:
        return shadow;
      case pb.ElementKind.NoElement:
        return none;
      default:
        assert(false);
        return false;
    }
    ;
  }

  bool get flame => hasAllFlag(flags, flameFlag);
  set flame(bool state) => flags = setFlag(flags, flameFlag);
  bool get water => hasAllFlag(flags, waterFlag);
  set water(bool state) => flags = setFlag(flags, waterFlag);
  bool get wind => hasAllFlag(flags, windFlag);
  set wind(bool state) => flags = setFlag(flags, windFlag);
  bool get light => hasAllFlag(flags, lightFlag);
  set light(bool state) => flags = setFlag(flags, lightFlag);
  bool get shadow => hasAllFlag(flags, shadowFlag);
  set shadow(bool state) => flags = setFlag(flags, shadowFlag);
  bool get none => hasAllFlag(flags, noneFlag);
  set none(bool state) => flags = setFlag(flags, noneFlag);
  bool get all => !hasAnyFlag(flags, allFlag) || hasAllFlag(flags, allFlag);

  void resetAll() => flags = 0;

  ElementSelection clone() => ElementSelection(flags);
}

class ElementFilter extends StatefulWidget {
  final Function(ElementSelection) onChanged;
  final Axis direction;
  final double buttonSize;
  final int uses;
  final ElementSelection initialSelection;

  ElementFilter(
      {@required this.onChanged,
      this.buttonSize = 24,
      this.direction = Axis.horizontal,
      this.uses = ElementSelection.elementalFlag,
      this.initialSelection});

  @override
  State<StatefulWidget> createState() => ElementFilterState();
}

class ElementFilterState extends State<ElementFilter> {
  ElementSelection _sel;

  Widget _buildWidget(BuildContext context, String elementName, int flag) {
    return SizedBox(
      width: widget.buttonSize,
      height: widget.buttonSize,
      child: ShapeToggleButton(
        state: hasAllFlag(_sel.flags, flag),
        child: Image(
          image: DragaliIcons.element(elementName),
        ),
        onTap: () {
          var newSel = _sel.clone();
          newSel.flags = switchFlag(newSel.flags, flag);
          setState(() {
            _sel.flags = newSel.flags;
          });
          widget.onChanged?.call(newSel);
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _sel = widget.initialSelection?.clone() ?? ElementSelection();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (hasAllFlag(widget.uses, ElementSelection.flameFlag))
          _buildWidget(context, 'Flame', ElementSelection.flameFlag),
        if (hasAllFlag(widget.uses, ElementSelection.waterFlag))
          _buildWidget(context, 'Water', ElementSelection.waterFlag),
        if (hasAllFlag(widget.uses, ElementSelection.windFlag))
          _buildWidget(context, 'Wind', ElementSelection.windFlag),
        if (hasAllFlag(widget.uses, ElementSelection.lightFlag))
          _buildWidget(context, 'Light', ElementSelection.lightFlag),
        if (hasAllFlag(widget.uses, ElementSelection.shadowFlag))
          _buildWidget(context, 'Shadow', ElementSelection.shadowFlag),
        if (hasAllFlag(widget.uses, ElementSelection.noneFlag))
          _buildWidget(context, 'None', ElementSelection.noneFlag),
      ],
    );
  }
}
