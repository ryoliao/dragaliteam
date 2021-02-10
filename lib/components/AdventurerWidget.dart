import '../DataCenter.dart';
import '../components/SquaredImage.dart';
import '../proto/dragali.pb.dart' as pb;
import 'package:flutter/material.dart';

import '../DragaliIcons.dart';
import '../util.dart';
import 'AbilityWidget.dart';

enum AbilityStyle { Side, RightBottom }

class AdventurerWidget extends StatelessWidget {
  final int id;
  final double size;
  final pb.Adventurer data;
  final AbilityStyle abilityStyle;

  AdventurerWidget(
    this.id, {
    @required this.size,
    this.abilityStyle,
    pb.Adventurer data,
  })  : data = data ?? DataCenter.adventurer(id),
        super(key: ValueKey(id));

  @override
  Widget build(BuildContext context) {
    if (isNullOrZero(id)) {
      return SquaredImage(
        size: size,
        image: DragaliIcons.blank,
      );
    }

    var img = DragaliIcons.adventurer(data.image);
    if (abilityStyle != null) {
      switch (abilityStyle) {
        case AbilityStyle.Side:
          return Row(
            children: [
              Tooltip(
                message: data.name,
                child: SquaredImage(
                  size: size,
                  image: img,
                ),
              ),
              Column(
                children: [
                  AbilityWidget(data.idCoAbility, size: size * 0.5),
                  AbilityWidget(data.idChainCoAbility, size: size * 0.5),
                ],
              ),
            ],
          );
          break;
        case AbilityStyle.RightBottom:
        default:
          return Stack(
            children: [
              Tooltip(
                message: data.name,
                child: SquaredImage(
                  size: size,
                  image: img,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Row(
                  children: [
                    AbilityWidget(data.idCoAbility, size: size * 0.25),
                    AbilityWidget(data.idChainCoAbility, size: size * 0.25),
                  ],
                ),
              ),
            ],
          );
          break;
      }
    } else {
      return Tooltip(
        message: data.name,
        child: SquaredImage(image: img, size: size),
      );
    }
  }
}
