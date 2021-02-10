import 'package:dragaliteam/DataCenter.dart';

import '../widgetUtil.dart';
import 'DragonSelectorWidget.dart';
import 'WyrmprintSelectorWidget.dart';
import '../proto/dragali.pb.dart' as pb;
import 'package:flutter/material.dart';
import 'AdventurerSelectorWidget.dart';
import 'AdventurerWidget.dart';
import 'DragonWidget.dart';
import 'ShareableSkillSelectorWidget.dart';
import 'ShareableSkillWidget.dart';
import 'WeaponSelectorWidget.dart';
import 'WeaponWidget.dart';
import 'WyrmprintWidget.dart';

class AdventurerSetupWidget extends StatefulWidget {
  final double size;
  final pb.AdventurerSetup data;
  final bool coop;

  AdventurerSetupWidget(
    this.data, {
    @required this.coop,
    @required this.size,
    key,
  }) : super(key: ObjectKey(data));

  @override
  State<StatefulWidget> createState() => AdventurerSetupWidgetState();
}

class AdventurerSetupWidgetState extends State<AdventurerSetupWidget> {
  pb.AdventurerSetup _data;

  @override
  void initState() {
    super.initState();
    _data = widget.data;
  }

  void _setAdventurer(BuildContext context) async {
    var newId = await showDialog<int>(
      context: context,
      builder: (context) {
        return AdventurerSelectorWidget(
          onPick: (id) {
            Navigator.pop(context, id);
          },
        );
      },
    );
    if (newId != null) {
      setState(() {
        if (newId == 0)
          _data.clearIdAdventurer();
        else
          _data.idAdventurer = newId;
      });
    }
  }

  void _setAdventurerEx(BuildContext context, Function(int) setter) async {
    var newId = await showDialog<int>(
      context: context,
      builder: (context) {
        return AdventurerSelectorWidget(
          onPick: (id) {
            Navigator.pop(context, id);
          },
        );
      },
    );
    if (newId != null) {
      setState(() {
        setter(newId);
      });
    }
  }

  void _setDragon(BuildContext context) async {
    var newId = await showDialog<int>(
      context: context,
      builder: (context) {
        return DragonSelectorWidget(
          onPick: (id) {
            Navigator.pop(context, id);
          },
        );
      },
    );
    if (newId != null) {
      setState(() {
        if (newId == 0)
          _data.clearIdDragon();
        else
          _data.idDragon = newId;
      });
    }
  }

  void _setWeapon(BuildContext context) async {
    var newId = await showDialog<int>(
      context: context,
      builder: (context) {
        return WeaponSelectorWidget(
          onPick: (id) {
            Navigator.pop(context, id);
          },
        );
      },
    );
    if (newId != null) {
      setState(() {
        if (newId == 0)
          _data.clearIdWeapon();
        else
          _data.idWeapon = newId;
      });
    }
  }

  void _setShareableSkill(BuildContext context, Function(int) setter) async {
    var newId = await showDialog<int>(
      context: context,
      builder: (context) {
        return ShareableSkillSelectorWidget(
          onPick: (id) {
            Navigator.pop(context, id);
          },
        );
      },
    );
    if (newId != null) {
      setState(() {
        setter(newId);
      });
    }
  }

  void _setWyrmprint(
    BuildContext context,
    WyrmprintType type,
    Function(int) setter,
  ) async {
    var newId = await showDialog<int>(
      context: context,
      builder: (context) {
        return WyrmprintSelectorWidget(
          type: type,
          onPick: (id) {
            Navigator.pop(context, id);
          },
        );
      },
    );
    if (newId != null) {
      setState(() {
        setter(newId);
      });
    }
  }

  Widget _buildAdventurer(BuildContext context, double size) {
    return GestureDetector(
      onTap: () => _setAdventurer(context),
      child: AdventurerWidget(
        _data.hasIdAdventurer() ? _data.idAdventurer : null,
        size: size,
        abilityStyle: AbilityStyle.RightBottom,
      ),
    );
  }

  Widget _buildAdventurerEx(BuildContext context, double size) {
    return Row(
      children: [
        // ex 2
        GestureDetector(
          onTap: () => _setAdventurerEx(context, (id) {
            if (id == 0)
              _data.clearIdEx2();
            else
              _data.idEx2 = id;
          }),
          child: AdventurerWidget(
            _data.hasIdEx2() ? _data.idEx2 : null,
            size: size,
            abilityStyle: AbilityStyle.Side,
          ),
        ),
        // ex 3
        GestureDetector(
          onTap: () => _setAdventurerEx(context, (id) {
            if (id == 0)
              _data.clearIdEx3();
            else
              _data.idEx3 = id;
          }),
          child: AdventurerWidget(
            _data.hasIdEx3() ? _data.idEx3 : null,
            size: size,
            abilityStyle: AbilityStyle.Side,
          ),
        ),
        // ex 4
        GestureDetector(
          onTap: () => _setAdventurerEx(context, (id) {
            if (id == 0)
              _data.clearIdEx4();
            else
              _data.idEx4 = id;
          }),
          child: AdventurerWidget(
            _data.hasIdEx4() ? _data.idEx4 : null,
            size: size,
            abilityStyle: AbilityStyle.Side,
          ),
        ),
      ],
    );
  }

  Widget _buildMainEquipment(BuildContext context, double size) {
    return Column(
      children: [
        // weapon and dragon
        Row(
          children: [
            GestureDetector(
              onTap: () => _setWeapon(context),
              child: WeaponWidget(
                _data.hasIdWeapon() ? _data.idWeapon : null,
                size: size,
              ),
            ),
            GestureDetector(
              onTap: () => _setDragon(context),
              child: DragonWidget(
                _data.hasIdDragon() ? _data.idDragon : null,
                size: size,
              ),
            ),
          ],
        ),
        // shareablle skills
        Row(
          children: [
            GestureDetector(
              onTap: () => _setShareableSkill(context, (id) {
                if (id == 0)
                  _data.clearIdAdventurerSs1();
                else
                  _data.idAdventurerSs1 = id;
              }),
              child: ShareableSkillWidget(
                _data.hasIdAdventurerSs1() ? _data.idAdventurerSs1 : null,
                size: size,
              ),
            ),
            GestureDetector(
              onTap: () => _setShareableSkill(context, (id) {
                if (id == 0)
                  _data.clearIdAdventurerSs2();
                else
                  _data.idAdventurerSs2 = id;
              }),
              child: ShareableSkillWidget(
                _data.hasIdAdventurerSs2() ? _data.idAdventurerSs2 : null,
                size: size,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPrints(BuildContext context, double size) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => _setWyrmprint(context, WyrmprintType.A, (id) {
                if (id == 0)
                  _data.clearIdPrintA1();
                else
                  _data.idPrintA1 = id;
              }),
              child: WyrmprintWidget(
                _data.hasIdPrintA1() ? _data.idPrintA1 : null,
                size: size,
                type: WyrmprintType.A,
              ),
            ),
            GestureDetector(
              onTap: () => _setWyrmprint(context, WyrmprintType.A, (id) {
                if (id == 0)
                  _data.clearIdPrintA2();
                else
                  _data.idPrintA2 = id;
              }),
              child: WyrmprintWidget(
                _data.hasIdPrintA2() ? _data.idPrintA2 : null,
                size: size,
                type: WyrmprintType.A,
              ),
            ),
            GestureDetector(
              onTap: () => _setWyrmprint(context, WyrmprintType.A, (id) {
                if (id == 0)
                  _data.clearIdPrintA3();
                else
                  _data.idPrintA3 = id;
              }),
              child: WyrmprintWidget(
                _data.hasIdPrintA3() ? _data.idPrintA3 : null,
                size: size,
                type: WyrmprintType.A,
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => _setWyrmprint(context, WyrmprintType.B, (id) {
                if (id == 0)
                  _data.clearIdPrintB1();
                else
                  _data.idPrintB1 = id;
              }),
              child: WyrmprintWidget(
                _data.hasIdPrintB1() ? _data.idPrintB1 : null,
                size: size,
                type: WyrmprintType.B,
              ),
            ),
            GestureDetector(
              onTap: () => _setWyrmprint(context, WyrmprintType.B, (id) {
                if (id == 0)
                  _data.clearIdPrintB2();
                else
                  _data.idPrintB2 = id;
              }),
              child: WyrmprintWidget(
                _data.hasIdPrintB2() ? _data.idPrintB2 : null,
                size: size,
                type: WyrmprintType.B,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _onMorePressed(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.copy),
                    title: new Text('Copy'),
                    onTap: () {
                      setState(() {
                        DataCenter.adventurerClipboard = _data.clone();
                      });
                      Navigator.pop(context);
                    }),
                new ListTile(
                  leading: new Icon(Icons.paste),
                  title: new Text('Paste'),
                  enabled: DataCenter.adventurerClipboard != null,
                  onTap: () {
                    setState(() {
                      _data.clear();
                      _data.mergeFromMessage(DataCenter.adventurerClipboard);
                    });
                    Navigator.pop(context);
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.cut),
                  title: new Text('Cut'),
                  onTap: () {
                    setState(() {
                      DataCenter.adventurerClipboard = _data.clone();
                      _data.clear();
                    });
                    Navigator.pop(context);
                  },
                ),
                new ListTile(
                  leading: new Icon(Icons.clear),
                  title: new Text('Clear'),
                  onTap: () {
                    setState(() {
                      _data.clear();
                    });
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size * teamWidthFactor,
      child: Card(
        color: Colors.black26,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 8,
                left: 8,
                bottom: 8,
                right: 16,
              ),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildAdventurer(context, widget.size),
                        if (widget.coop ?? false)
                          _buildAdventurerEx(context, widget.size * 0.3),
                      ],
                    ),
                    // main panel
                    _buildMainEquipment(context, widget.size * 0.5),
                    // prints panel
                    _buildPrints(context, widget.size * 0.5),
                  ],
                ),
              ),
            ),
            Positioned(
              right: -4,
              top: -4,
              child: IconButton(
                iconSize: 16,
                icon: Icon(Icons.more_vert_rounded),
                onPressed: () => _onMorePressed(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
