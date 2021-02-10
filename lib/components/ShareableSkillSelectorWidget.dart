import 'package:dragaliteam/components/FilterAppBar.dart';
import 'package:dragaliteam/components/RarityFilter.dart';
import 'package:dragaliteam/proto/dragali.pb.dart' as pb;
import 'package:flutter/material.dart';
import '../DataCenter.dart';
import 'ElementFilter.dart';
import 'ShareableSkillWidget.dart';
import 'WeaponFilter.dart';

class ShareableSkillSelectorWidget extends StatefulWidget {
  final void Function(int id) onPick;

  ShareableSkillSelectorWidget({this.onPick});

  @override
  State<StatefulWidget> createState() => ShareableSkillSelectorWidgetState();
}

class ShareableSkillSelectorWidgetState
    extends State<ShareableSkillSelectorWidget> {
  ElementSelection _selElement;
  WeaponSelection _selWeapon;
  RaritySelection _selRarity;
  List<MapEntry<int, pb.ShareableSkill>> _items;

  @override
  void initState() {
    super.initState();
    _selElement = ElementSelection();
    _selWeapon = WeaponSelection();
    _selRarity = RaritySelection();
    _buildItems();
  }

  void _buildItems() {
    var list = DataCenter.instance.shareableSkills.entries;
    if (!(_selElement?.all ?? false)) {
      list = list.where(_filterElementItem);
    }
    if (!(_selWeapon?.all ?? false)) {
      list = list.where(_filterWeaponItem);
    }
    if (!(_selRarity?.all(3, 6) ?? false)) {
      list = list.where(_filterRarityItem);
    }
    _items = [MapEntry(0, null), ...list];
  }

  bool _filterElementItem(MapEntry<int, pb.ShareableSkill> e) {
    switch (e.value.from) {
      case pb.ShareableSkillFrom.SkillFromAdventurer:
        return _selElement.has(DataCenter.instance.adventurers[e.key].element);
      case pb.ShareableSkillFrom.SkillFromWeapon:
        return _selElement.has(DataCenter.instance.weapons[e.key].element);
      default:
        return false;
    }
  }

  bool _filterWeaponItem(MapEntry<int, pb.ShareableSkill> e) {
    switch (e.value.from) {
      case pb.ShareableSkillFrom.SkillFromAdventurer:
        return _selWeapon.has(DataCenter.instance.adventurers[e.key].weapon);
      case pb.ShareableSkillFrom.SkillFromWeapon:
        return _selWeapon.has(DataCenter.instance.weapons[e.key].weapon);
      default:
        return false;
    }
  }

  bool _filterRarityItem(MapEntry<int, pb.ShareableSkill> e) {
    switch (e.value.from) {
      case pb.ShareableSkillFrom.SkillFromAdventurer:
        return _selRarity.has(DataCenter.instance.adventurers[e.key].rarity);
      case pb.ShareableSkillFrom.SkillFromWeapon:
        return _selRarity.has(DataCenter.instance.weapons[e.key].rarity);
      default:
        return false;
    }
  }

  Widget _buildWidget(BuildContext context, int index) {
    var e = _items[index];
    return GestureDetector(
      onTap: () => widget.onPick(e.key),
      child: ShareableSkillWidget(
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
              minRarity: 3,
              maxRarity: 6,
              onChanged: (s) {
                setState(() {
                  _selRarity = s;
                  _buildItems();
                });
              },
            ),
            WeaponFilter(
              onChanged: (s) {
                setState(() {
                  _selWeapon = s;
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
            title: Text("Skill Picker"),
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
