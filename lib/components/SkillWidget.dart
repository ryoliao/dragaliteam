import '../DataCenter.dart';
import '../proto/dragali.pb.dart' as pb;
import 'package:flutter/material.dart';

import '../DragaliIcons.dart';
import 'SquaredImage.dart';

class SkillWidget extends StatelessWidget {
  final int id;
  final double size;
  final pb.Skill data;

  SkillWidget(this.id, {@required this.size})
      : data = DataCenter.skill(id),
        super(key: ValueKey(id));

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: data.name,
      child: SquaredImage(
        size: size,
        image: DragaliIcons.skill(data.image),
      ),
    );
  }
}
