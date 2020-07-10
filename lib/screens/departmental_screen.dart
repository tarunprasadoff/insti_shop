import 'package:flutter/material.dart';
import 'package:insti_shop/models/inventory_item.dart';
import 'package:insti_shop/models/shop.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/providers/departmental_items.dart';
import 'package:insti_shop/widgets/dummy_body.dart';
import 'package:insti_shop/widgets/inventory_items_list_widget.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';
import 'package:insti_shop/widgets/my_shop_detail_image_stack.dart';
import 'package:provider/provider.dart';

class DepartmentalScreen extends StatelessWidget {
  static const routeName = '/departmental_screen.dart';

  final Shop _shop;

  DepartmentalScreen(this._shop);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    final double _imageHeight = mediaQuery.height * 0.25;

    final List<InventoryItem> _currentShopItems =
        Provider.of<DepartmentalItems>(context)
            .getCurrentShopItems(_shop.title);
    final List<String> _categoriesList =
        Provider.of<DepartmentalItems>(context, listen: false)
            .getCurrentShopItemsListCategories(_currentShopItems);

    return Scaffold(
      appBar: MyAppBar(_shop.title),
      body: Container(
        width: mediaQuery.width,
        child: Column(
          children: <Widget>[
            MyShopDetailImageStack(
              shop: _shop,
              imageHeight: _imageHeight,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(unitSize * 15),
                bottomRight: Radius.circular(unitSize * 15),
              ),
            ),
            _currentShopItems.length == 0
                ? Expanded(
                    child: DummyBody(
                    'No Items Available',
                    isfullText: true,
                  ))
                : InventoryItemsListWidget(
                    categoriesList: _categoriesList,
                    currentShopItems: _currentShopItems),
          ],
        ),
      ),
    );
  }
}
