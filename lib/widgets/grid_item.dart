import 'package:flutter/material.dart';
import 'package:insti_shop/models/type_manager.dart';
import 'package:insti_shop/screens/shops_screen.dart';
import 'package:insti_shop/widgets/order_type_select.dart';

class GridItem extends StatelessWidget {
  final ShopType _shopType;
  final String _assetName;

  GridItem(this._shopType, this._assetName);

  void _navigateFunction(BuildContext ctx, OrderType _orderType) {
    Navigator.of(ctx).pushNamed(ShopsScreen.routeName,
        arguments: {'shopType': _shopType, 'orderType': _orderType});
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        OrderTypeSelect().getOrderTypeSelectSheet(
            context, mediaQuery, _shopType, _navigateFunction);
      },
      child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(_assetName)))),
    );
  }
}
