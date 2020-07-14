import 'package:flutter/material.dart';
import 'package:insti_shop/models/shop.dart';
import 'package:insti_shop/models/type_manager.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/screens/departmental_screen.dart';
import 'package:insti_shop/screens/gen_screen.dart';
import 'package:insti_shop/widgets/my_shop_detail_image_stack.dart';

class ShopItem extends StatelessWidget {
  final Shop _shop;
  final OrderType orderType;
  ShopItem(
    this._shop,
    this.orderType,
  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    final double _imageHeight = mediaQuery.height * 0.25;
    return InkWell(
      onTap: () {
        if (_shop.type == ShopType.departmental) {
          Navigator.of(context, rootNavigator: true).pushNamed(
              DepartmentalScreen.routeName,
              arguments: {'shop': _shop, 'orderType': orderType});
        } else {
          Navigator.of(context, rootNavigator: true)
              .pushNamed(GenScreen.routeName, arguments: _shop.title);
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(unitSize * 15)),
        elevation: 6,
        margin: EdgeInsets.all(unitSize * 10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyShopDetailImageStack(
                shop: _shop,
                imageHeight: _imageHeight,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(unitSize * 15),
                  topRight: Radius.circular(unitSize * 15),
                ),
              ),
              Divider(
                height: unitSize * 6,
                thickness: unitSize * 6,
                color: Theme.of(context).primaryColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: unitSize * 10, vertical: unitSize * 2),
                child: ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    color: Theme.of(context).primaryColor,
                    size: unitSize * Theme.of(context).iconTheme.size,
                  ),
                  title: Text(
                    _shop.description,
                    textScaleFactor: unitSize,
                    textAlign: TextAlign.left,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 16),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
