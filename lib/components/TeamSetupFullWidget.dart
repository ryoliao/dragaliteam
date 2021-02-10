import '../proto/dragali.pb.dart' as pb;
import 'package:flutter/material.dart';
import 'AdventurerSetupWidget.dart';

class TeamSetupWidget extends StatefulWidget {
  final double size;
  final pb.TeamSetup data;
  final GlobalKey captureKey;

  TeamSetupWidget(this.data, {@required this.size, this.captureKey})
      : super(key: ObjectKey(data));

  @override
  State<StatefulWidget> createState() => TeamSetupWidgetState();
}

class TeamSetupWidgetState extends State<TeamSetupWidget> {
  pb.TeamSetup _data;

  @override
  void initState() {
    super.initState();
    _data = widget.data;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      key: widget.captureKey,
      child: UnconstrainedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AdventurerSetupWidget(
              _data.adventurer1,
              coop: _data.coop,
              size: widget.size,
            ),
            AdventurerSetupWidget(
              _data.adventurer2,
              coop: _data.coop,
              size: widget.size,
            ),
            AdventurerSetupWidget(
              _data.adventurer3,
              coop: _data.coop,
              size: widget.size,
            ),
            AdventurerSetupWidget(
              _data.adventurer4,
              coop: _data.coop,
              size: widget.size,
            ),
          ],
        ),
      ),
    );
  }
}
