import '../DataCenter.dart';
import '../proto/dragali.pb.dart' as pb;
import 'package:flutter/material.dart';

import '../DragaliIcons.dart';
import '../util.dart';
import 'SquaredImage.dart';

class WeaponWidget extends StatelessWidget {
  final int id;
  final double size;
  final pb.Weapon data;

  WeaponWidget(this.id, {@required this.size, pb.Weapon data})
      : data = data ?? DataCenter.weapon(id),
        super(key: ValueKey(id));

  @override
  Widget build(BuildContext context) {
    if (isNullOrZero(id)) {
      return Image(image: DragaliIcons.blank, height: size);
    }
    return Tooltip(
      message: data.name,
      child: SquaredImage(
        size: size,
        image: DragaliIcons.weapon(data.image),
      ),
    );
  }
}
