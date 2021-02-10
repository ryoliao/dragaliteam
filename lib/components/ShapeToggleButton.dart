// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class ShapeToggleButton extends StatelessWidget {
  final Widget child;
  final Function() onTap;
  final bool state;
  final BoxShape shape;
  final BoxBorder border;
  final BorderRadiusGeometry borderRadius;

  ShapeToggleButton({
    @required this.child,
    @required this.state,
    this.onTap,
    this.shape,
    this.border,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: state
          ? BoxDecoration(
              border: border ?? Border.all(color: Colors.yellow, width: 3),
              shape: shape ?? BoxShape.circle,
              borderRadius: borderRadius,
            )
          : null,
      child: GestureDetector(
        onTap: onTap,
        child: child,
      ),
    );
  }
}
