import 'dart:async';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'BottomBar.dart';
import 'DataCenter.dart';
// import 'components/NavDrawer.dart';
import 'components/TeamSetupFullWidget.dart';
import 'proto/dragali.pb.dart' as pb;
import 'dart:convert';
import 'package:clipboard/clipboard.dart';
import 'widgetUtil.dart';

void main() async {
  await DataCenter.initialize();
  runApp(DragaliTeamApp());
}

class DragaliTeamApp extends StatelessWidget {
  static Route<dynamic> get defaultRoute => teamRoute(DataCenter.defaultTeam);

  static Route<dynamic> teamRoute(pb.TeamSetup teamData) {
    return MaterialPageRoute(builder: (context) {
      return MainPage(
        team: teamData,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dragalia Lost Team',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return defaultRoute;
        } else {
          var encoded = settings.name;
          try {
            pb.TeamSetup team = pb.TeamSetup.fromBuffer(
              base64Url.decode(encoded),
            );
            return teamRoute(team);
          } catch (_) {
            return defaultRoute;
          }
        }
      },
      theme: ThemeData.dark(),
    );
  }
}

class MainPage extends StatefulWidget {
  final pb.TeamSetup team;

  MainPage({@required this.team, Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey _captureKey = new GlobalKey();

  static final RegExp baseUrlExpr = RegExp(r'\#.*');
  void _share(BuildContext context) async {
    var encoded = base64Url.encode(widget.team.writeToBuffer());
    var baseUrl = Uri.base.toString().replaceAll(baseUrlExpr, '');

    var link = '$baseUrl#$encoded';
    //link = await _makeTinyUrl(link);

    if (link != null) {
      FlutterClipboard.copy(link).then((value) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Share link copied!')),
        );
      });
    }
  }

  // static Future<String> _makeTinyUrl(String link) async {
  //   var resp = await http
  //       .get('https://tinyurl.com/api-create.php?url=${Uri.encodeFull(link)}');
  //   if (resp.statusCode != 200) return null;
  //   var result = resp.body;
  //   if (null == Uri.tryParse(result)) return null;
  //   return result;
  // }

  @override
  Widget build(BuildContext context) {
    var teamSize = preferredTeamSize(context);
    return Scaffold(
      //drawer: NavDrawer(),
      appBar: AppBar(
        title: Center(
          child: Image.asset('assets/image/logo_title.png', height: 48),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 12, bottom: 12),
            child: TeamSetupWidget(
              widget.team,
              size: teamSize,
              captureKey: _captureKey,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _share(context),
        tooltip: 'Share',
        backgroundColor: Colors.deepOrange,
        child: Icon(Icons.share),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomBar(
        shape: CircularNotchedRectangle(),
        coop: widget.team.coop ?? false,
        onCoopChanged: (value) {
          setState(() {
            if (!value)
              widget.team.clearCoop();
            else
              widget.team.coop = true;
          });
        },
      ),
    );
  }
}
