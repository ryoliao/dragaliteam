import '../DataCenter.dart';
import '../proto/dragali.pb.dart' as pb;
import 'package:flutter/material.dart';

import '../DragaliIcons.dart';
import '../util.dart';
import 'SquaredImage.dart';

class DragonWidget extends StatelessWidget {
  final int id;
  final double size;
  final pb.Dragon data;

  DragonWidget(this.id, {@required this.size, pb.Dragon data})
      : data = data ?? DataCenter.dragon(id),
        super(key: ValueKey(id));

  @override
  Widget build(BuildContext context) {
    if (isNullOrZero(id)) {
      return SquaredImage(
        size: size,
        image: DragaliIcons.blankDragon,
      );
    }
    return Tooltip(
      message: data.name,
      child: SquaredImage(
        size: size,
        image: DragaliIcons.dragon(data.image),
      ),
    );
  }
}
