import 'package:flutter/material.dart';

class SquaredImage extends StatelessWidget {
  final ImageProvider<Object> image;
  final double size;
  final BoxFit fit;

  SquaredImage({
    @required this.image,
    @required this.size,
    this.fit = BoxFit.fitHeight,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Image(
        image: image,
        fit: fit,
      ),
    );
  }
}
