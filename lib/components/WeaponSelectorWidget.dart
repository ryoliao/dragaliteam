import 'package:dragaliteam/proto/dragali.pb.dart' as pb;
import 'package:flutter/material.dart';
import '../DataCenter.dart';
import 'FilterAppBar.dart';
import 'ElementFilter.dart';
import 'WeaponFilter.dart';
import 'RarityFilter.dart';
import 'WeaponWidget.dart';

class WeaponSelectorWidget extends StatefulWidget {
  final void Function(int id) onPick;

  WeaponSelectorWidget({this.onPick});

  @override
  State<StatefulWidget> createState() => WeaponSelectorWidgetState();
}

class WeaponSelectorWidgetState extends State<WeaponSelectorWidget> {
  ElementSelection _selElement;
  WeaponSelection _selWeapon;
  RaritySelection _selRarity;
  List<MapEntry<int, pb.Weapon>> _items;

  @override
  void initState() {
    super.initState();
    _selElement = ElementSelection();
    _selWeapon = WeaponSelection();
    _selRarity = RaritySelection();
    _buildItems();
  }

  void _buildItems() {
    var list = DataCenter.instance.weapons.entries;
    if (!(_selElement?.all ?? false)) {
      list = list.where((i) => _selElement.has(i.value.element));
    }
    if (!(_selWeapon?.all ?? false)) {
      list = list.where((i) => _selWeapon.has(i.value.weapon));
    }
    if (!(_selRarity?.all(1, 6) ?? false)) {
      list = list.where((i) => _selRarity.has(i.value.rarity));
    }
    _items = [MapEntry(0, null), ...list];
  }

  Widget _buildWidget(BuildContext context, int index) {
    var e = _items[index];
    return GestureDetector(
      onTap: () => widget.onPick(e.key),
      child: WeaponWidget(
        e.key,
        size: 64,
        data: e.value,
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          children: [
            ElementFilter(
              uses: ElementSelection.allFlag,
              onChanged: (s) {
                setState(() {
                  _selElement = s;
                  _buildItems();
                });
              },
            ),
            RarityFilter(
              minRarity: 1,
              maxRarity: 6,
              onChanged: (s) {
                setState(() {
                  _selRarity = s;
                  _buildItems();
                });
              },
            ),
          ],
        ),
        Divider(
          height: 4,
          thickness: 2,
        ),
        Expanded(
          child: GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 64,
              childAspectRatio: 1,
            ),
            itemCount: _items.length,
            itemBuilder: (context, index) => _buildWidget(context, index),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Weapon Picker"),
          ),
          body: Padding(
            padding: EdgeInsets.all(8),
            child: _buildContent(context),
          ),
        ),
      ),
    );
  }
}
