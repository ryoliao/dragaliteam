import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:dragaliteam/DataCenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:html' as html;
// import 'package:filepicker_windows/filepicker_windows.dart';
import 'DragaliIcons.dart';
import 'proto/dragali.pb.dart' as pb;
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

const double teamWidthFactor = 4.5;

double preferredTeamSize(BuildContext context, {double maxSize = 128}) {
  var screenWidth = MediaQuery.of(context).size.width;
  double teamWidth = maxSize * teamWidthFactor;
  if (teamWidth > screenWidth) {
    maxSize *= screenWidth / teamWidth;
  }
  return maxSize;
}

double preferredWidgetWidth(BuildContext context, {double maxSize = 128}) {
  var screenWidth = MediaQuery.of(context).size.width;
  double teamWidth = maxSize * teamWidthFactor;
  return (teamWidth > screenWidth) ? screenWidth : teamWidth;
}

void saveFile(ByteData data, String filename, {String contentType}) {
  final bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  final blob = html.Blob([bytes], contentType);
  final url = html.Url.createObjectUrlFromBlob(blob);
  final anchor = html.document.createElement('a') as html.AnchorElement
    ..href = url
    ..style.display = 'none'
    ..download = filename;
  html.document.body.children.add(anchor);

  // download
  anchor.click();

  // cleanup
  html.document.body.children.remove(anchor);
  html.Url.revokeObjectUrl(url);
}

Future<ui.Image> _loadImage(String assetPath) async {
  var imgData = await rootBundle.load(assetPath);
  var imgList = Uint8List.view(imgData.buffer);
  var completer = Completer<ui.Image>();
  ui.decodeImageFromList(imgList, completer.complete);
  return await completer.future;
}

void capturePng(GlobalKey key, String saveName) async {
  var pictureRecorder = ui.PictureRecorder();
  var canvas = ui.Canvas(pictureRecorder);

  var img = await _loadImage('assets/image/logo_title.png');
  var dSize = Size(img.width.toDouble(), img.height.toDouble());
  var r = Rect.fromLTWH(0, 0, dSize.width, dSize.height);
  canvas.drawImageRect(img, r, r, Paint());

  var imgB = await pictureRecorder.endRecording().toImage(64, 64);
  var byteData = await imgB.toByteData(format: ui.ImageByteFormat.png);

  saveFile(byteData, "teamset.png", contentType: "image/png");

  // RenderRepaintBoundary boundary = key.currentContext.findRenderObject();

  // ui.Image image =
  //     await boundary.toImage(pixelRatio: html.window.devicePixelRatio);
  // ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
  // saveFile(byteData, saveName);

  // setState(() {});

  // var picker = SaveFilePicker();
  // picker.title = "Save team to png file";
  // picker.fileName = "teamset";
  // picker.defaultExtension = "png";

  // var file = picker.getFile();
  // if (file != null) {
  //   file.writeAsBytes(byteData.buffer
  //       .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  // }
}

// void _uploadTeam(BuildContext ctx) async {
//   // var picker = OpenFilePicker();
//   // picker.defaultExtension = "dlTeam";
//   // picker.title = "Open team file";

//   // var file = picker.getFile();
//   // if (file != null) {
//   //   var bytes = await file.readAsBytes();
//   //   setState(() {
//   //     DataCenter.teamSetup = TeamSetup.fromBuffer(bytes);
//   //   });
//   //   ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
//   //   ScaffoldMessenger.of(ctx).showSnackBar(
//   //     SnackBar(content: Text('Load succeed')),
//   //   );
//   // }
// }

// void _downloadTeam(BuildContext ctx) {
//   // var picker = SaveFilePicker();
//   // picker.title = "Save team file";
//   // picker.fileName = "team";
//   // picker.defaultExtension = "dlTeam";

//   // var file = picker.getFile();
//   // if (file != null) {
//   //   var bytes = DataCenter.teamSetup.writeToBuffer();
//   //   file.writeAsBytes(bytes);

//   //   ScaffoldMessenger.of(ctx).hideCurrentSnackBar();
//   //   ScaffoldMessenger.of(ctx).showSnackBar(
//   //     SnackBar(content: Text('Save succeed')),
//   //   );
//   // }
// }
