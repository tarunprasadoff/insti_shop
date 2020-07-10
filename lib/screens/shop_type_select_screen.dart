import 'package:flutter/material.dart';
import 'package:insti_shop/models/type_manager.dart';
import 'package:insti_shop/widgets/unit_size.dart';
import 'package:insti_shop/widgets/grid_item.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';
import 'package:insti_shop/widgets/my_logo.dart';

class ShopTypeSelectScreen extends StatelessWidget {
  final List<Map<String, Object>> _shopTypeAssetInfo =
      TypeManager().shopTypeAssetInfo;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);

    return Scaffold(
      appBar: MyAppBar('Shop'),
      body: Column(
        children: <Widget>[
          // Container(
          //   child: MyLogo(size: mediaQuery.width * 0.6),
          //   margin: EdgeInsets.only(top: unitSize * 10),
          // ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: mediaQuery.height * 0.08),
              child: GridView(
                physics: new NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(unitSize * 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: unitSize * 10,
                  mainAxisSpacing: mediaQuery.height * 0.1,
                ),
                children: <Widget>[
                  ..._shopTypeAssetInfo
                      .map((e) => GridItem(e['title'], e['assetName']))
                      .toList()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
