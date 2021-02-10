import 'package:flutter/material.dart';

class FilterAppBar extends StatelessWidget {
  final List<Widget> children;
  final double bottomSpace;

  FilterAppBar({this.children, this.bottomSpace = 24});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding:
            EdgeInsets.only(top: 4, left: 4, right: 4, bottom: bottomSpace),
        // child: IconTheme(
        //   data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
        // ),
      ),
    );
  }
}
