import '../DataCenter.dart';
import '../components/AdventurerWidget.dart';
import '../components/SkillWidget.dart';
import '../components/WeaponWidget.dart';
import '../proto/dragali.pb.dart' as pb;
import 'package:flutter/material.dart';

import '../DragaliIcons.dart';
import '../util.dart';
import 'SquaredImage.dart';

class ShareableSkillWidget extends StatelessWidget {
  final int id;
  final double size;
  final pb.ShareableSkill data;

  ShareableSkillWidget(this.id, {@required this.size, pb.ShareableSkill data})
      : data = data ?? DataCenter.shareableSkill(id),
        super(key: ValueKey(id));

  @override
  Widget build(BuildContext context) {
    if (isNullOrZero(id)) {
      return SquaredImage(
        size: size,
        image: DragaliIcons.blank,
      );
    }

    Widget faceWidget;
    switch (data.from) {
      case pb.ShareableSkillFrom.SkillFromAdventurer:
        faceWidget = AdventurerWidget(id, size: size * 0.5);
        break;
      case pb.ShareableSkillFrom.SkillFromWeapon:
        faceWidget = WeaponWidget(id, size: size * 0.5);
        break;
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        SkillWidget(data.idSkill, size: size),
        Positioned(
          bottom: 0,
          right: 0,
          child: faceWidget,
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            alignment: Alignment.center,
            width: 16,
            height: 16,
            //clipBehavior: Clip.none,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black54,
            ),
            child: Text(
              data.cost.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
