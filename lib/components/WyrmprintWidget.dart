import '../DataCenter.dart';
import '../proto/dragali.pb.dart' as pb;
import 'package:flutter/material.dart';

import '../DragaliIcons.dart';
import '../util.dart';
import 'SquaredImage.dart';

enum WyrmprintType { A, B }

class WyrmprintWidget extends StatelessWidget {
  final int id;
  final double size;
  final pb.Wyrmprint data;
  final WyrmprintType type;

  WyrmprintWidget(this.id, {@required this.size, @required this.type})
      : data = DataCenter.wyrmprint(id),
        super(key: ValueKey(id));

  @override
  Widget build(BuildContext context) {
    if (isNullOrZero(id)) {
      switch (type) {
        case WyrmprintType.A:
          return SquaredImage(image: DragaliIcons.blankWyrmprintA, size: size);
        case WyrmprintType.B:
          return SquaredImage(image: DragaliIcons.blankWyrmprintB, size: size);
      }
    }
    return Tooltip(
      message: data.name,
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          children: [
            Image(
              image: DragaliIcons.wyrmprint(data.image),
            ),
            if (data.affinity != pb.AffinityKind.NoAffinity)
              Align(
                alignment: Alignment(-0.9, -0.3),
                child: SquaredImage(
                  size: size * 0.23,
                  image: DragaliIcons.affinity(data.affinity),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
