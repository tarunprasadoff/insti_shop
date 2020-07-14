import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/models/type_manager.dart';
import 'package:insti_shop/providers/cart.dart';
import 'package:insti_shop/providers/departmental_items.dart';
import 'package:insti_shop/providers/dummy_data_shops.dart';
import 'package:insti_shop/widgets/dummy_body.dart';
import 'package:insti_shop/widgets/inventory_item_widget.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';
import 'package:insti_shop/widgets/order_type_display.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen.dart';
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final double unitSize = UnitSize().getUnitSize(mediaQuery);
    final List<Map<String, Object>> _cartItems =
        Provider.of<Cart>(context).cartItems;
    final Map<String, Object> _cartDetails =
        Provider.of<Cart>(context).cartDetails;
    final TypeManager _typeManager = TypeManager();
    final ShopType _shopType = _cartDetails['shopType'];
    final OrderType _orderType = _cartDetails['orderType'];
    return Scaffold(
        appBar: _cartItems.length != 0
            ? MyAppBar(Provider.of<DummyDataShops>(context)
                .getShopTitle(_cartDetails['shopKey']))
            : MyAppBar('Cart'),
        body: _cartItems.length == 0
            ? DummyBody(
                'The Cart is Empty',
                isfullText: true,
              )
            : SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    OrderTypeDisplay(
                      _typeManager.getOrderTypeString(_orderType, _shopType),
                      _cartDetails['shopType'],
                      _typeManager.getOrderIconData(_orderType, _shopType),
                      null,
                      isFinal: true,
                    ),
                    if (_shopType == ShopType.departmental)
                      ..._cartItems.map((e) => InventoryItemWidget(
                          inventoryItem: Provider.of<DepartmentalItems>(context)
                              .getInventoryItem(e['itemKey']),
                          orderType: _orderType)),
                  ],
                ),
              ));
  }
}
