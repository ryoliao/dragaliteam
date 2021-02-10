import 'package:dragaliteam/components/AffinityFilter.dart';

import '../proto/dragali.pb.dart' as pb;
import 'package:flutter/material.dart';
import '../DataCenter.dart';
import 'WyrmprintWidget.dart';
import 'AbilityFilter.dart';

class WyrmprintSelectorWidget extends StatefulWidget {
  WyrmprintSelectorWidget({this.onPick, @required this.type});

  final void Function(int id) onPick;
  final WyrmprintType type;

  @override
  State<StatefulWidget> createState() => WyrmprintSelectorWidgetState();
}

class WyrmprintSelectorWidgetState extends State<WyrmprintSelectorWidget> {
  AbilitySelection _selAbility;
  AffinitySelection _selAffinity;
  List<MapEntry<int, pb.Wyrmprint>> _items;

  @override
  void initState() {
    super.initState();
    _selAbility = AbilitySelection.create();
    _selAffinity = AffinitySelection();
    _buildItems();
  }

  void _buildItems() {
    var list = DataCenter.instance.wyrmprints.entries;
    list = list.where((e) => _filterRarity(e.value));
    if (!_selAbility.all) {
      list = list.where((e) => _filterAbility(e.value));
    }
    if (!_selAffinity.all) {
      list = list.where((e) => _selAffinity.has(e.value.affinity));
    }
    _items = [MapEntry(0, null), ...list];
  }

  bool _filterAbility(pb.Wyrmprint ad) {
    var icon = DataCenter.instance.abilities[ad.idA11].image;
    return _selAbility.has(icon);
  }

  bool _filterRarity(pb.Wyrmprint ad) {
    switch (widget.type) {
      case WyrmprintType.A:
        return ad.rarity >= 5;
      case WyrmprintType.B:
      default:
        return ad.rarity < 5;
    }
  }

  Widget _buildWidget(BuildContext context, int index) {
    var id = _items[index].key;
    return GestureDetector(
      onTap: () => widget.onPick(id),
      child: WyrmprintWidget(
        id,
        size: 64,
        type: widget.type,
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        AffinityFilter(
          buttonSize: 36,
          onChanged: (s) {
            setState(() {
              _selAffinity = s;
              _buildItems();
            });
          },
        ),
        AbilityFilter(
          buttonSize: 36,
          onChanged: (s) {
            setState(() {
              _selAbility = s;
              _buildItems();
            });
          },
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
            title: Text("Wyrmprint Picker"),
          ),
          body: Padding(
            padding: EdgeInsets.all(8),
            child: buildContent(context),
          ),
        ),
      ),
    );
  }
}
