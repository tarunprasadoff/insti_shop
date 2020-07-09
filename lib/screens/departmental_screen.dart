import 'package:flutter/material.dart';
import 'package:insti_shop/models/inventory_item.dart';
import 'package:insti_shop/models/shop.dart';
import 'package:insti_shop/providers/departmental_items.dart';
import 'package:insti_shop/widgets/dummy_body.dart';
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
    final double _imageHeight = mediaQuery.height * 0.25;
    final List<InventoryItem> _currentShopItems =
        Provider.of<DepartmentalItems>(context)
            .getCurrentShopItems(_shop.title);
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
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            _currentShopItems.length == 0
                ? Expanded(
                    child: DummyBody(
                    'No Items Available',
                    isfullText: true,
                  ))
                : Expanded(
                    child: ListView.builder(
                      itemBuilder: (_, i) => ListTile(
                        title: Text(_currentShopItems[i].title),
                        subtitle: _currentShopItems[i].description == null
                            ? null
                            : Text(
                                _currentShopItems[i].description,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor),
                              ),
                        trailing:
                            Text('₹${_currentShopItems[i].price.toString()}'),
                      ),
                      itemCount: _currentShopItems.length,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
