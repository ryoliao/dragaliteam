import '../DataCenter.dart';
import 'SquaredImage.dart';
import '../proto/dragali.pb.dart' as pb;
import 'package:flutter/material.dart';

import '../DragaliIcons.dart';

class AbilityWidget extends StatelessWidget {
  final int id;
  final double size;
  final pb.Ability data;

  AbilityWidget(this.id, {@required this.size})
      : data = DataCenter.ability(id),
        super(key: ValueKey(id));

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: data.name,
      child: SquaredImage(
        size: size,
        image: DragaliIcons.ability(data.image),
      ),
    );
  }
}
