import 'package:flutter/material.dart';
import 'package:insti_shop/models/shop.dart';
import 'package:insti_shop/models/type_manager.dart';
import 'package:insti_shop/screens/departmental_screen.dart';
import 'package:insti_shop/screens/gen_screen.dart';
import 'package:insti_shop/widgets/my_shop_detail_image_stack.dart';

class ShopItem extends StatelessWidget {
  final Shop _shop;
  ShopItem(
    this._shop,
  );

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    final double _imageHeight = mediaQuery.height * 0.25;
    return InkWell(
      onTap: () {
        if (_shop.type == ShopType.departmental) {
          Navigator.of(context)
              .pushNamed(DepartmentalScreen.routeName, arguments: _shop);
        } else {
          Navigator.of(context)
              .pushNamed(GenScreen.routeName, arguments: _shop.title);
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyShopDetailImageStack(
                shop: _shop,
                imageHeight: _imageHeight,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              Divider(
                height: 6,
                thickness: 6,
                color: Theme.of(context).primaryColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                child: ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    _shop.description,
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
