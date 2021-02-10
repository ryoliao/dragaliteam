// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    this.coop,
    this.onCoopChanged,
    this.shape,
  });

  final NotchedShape shape;
  final Function(bool) onCoopChanged;
  final bool coop;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          children: [
            Tooltip(
              message: coop ? 'Co-op' : 'Solo',
              child: IconButton(
                icon: Icon(coop ? Icons.group : Icons.person),
                onPressed: () {
                  onCoopChanged(!coop);
                },
              ),
            ),
            // IconButton(
            //   tooltip: "Open Team File",
            //   icon: const Icon(Icons.file_upload),
            //   onPressed: onUpload,
            // ),
            // if (centerLocations.contains(fabLocation)) const Spacer(),
            // IconButton(
            //   tooltip: "Save Team File",
            //   icon: const Icon(Icons.file_download),
            //   onPressed: onDownload,
            // ),
          ],
        ),
      ),
    );
  }
}
