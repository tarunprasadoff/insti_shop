import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/models/inventory_item.dart';
import 'package:insti_shop/models/type_manager.dart';
import 'package:insti_shop/providers/cart.dart';
import 'package:insti_shop/providers/departmental_items.dart';
import 'package:insti_shop/providers/dummy_data_shops.dart';
import 'package:insti_shop/widgets/checkout_bar.dart';
import 'package:insti_shop/widgets/dummy_body.dart';
import 'package:insti_shop/widgets/inventory_item_widget.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen';
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final double unitSize = UnitSize().getUnitSize(mediaQuery);
    final List<Map<String, Object>> _cartItems =
        Provider.of<Cart>(context).cartItems;
    final Map<String, Object> _cartDetails =
        Provider.of<Cart>(context).cartDetails;
    final ShopType _shopType = _cartDetails['shopType'];
    final OrderType _orderType = _cartDetails['orderType'];
    final List<InventoryItem> _currentShopItems =
        Provider.of<DepartmentalItems>(context)
            .getCurrentShopItems(_cartDetails['shopKey']);
    final double _currentItemsTotalPrice = Provider.of<Cart>(context)
        .getDepartmentalItemsPriceTotal(_currentShopItems);
    final double _gstPrice =
        Price().getGSTPrice(_currentItemsTotalPrice, _cartDetails['orderType']);
    final double _netTotalPrice = Price()
        .getNetTotalPrice(_currentItemsTotalPrice, _cartDetails['orderType']);
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
                  SizedBox(height: unitSize * 10),
                  Card(
                    elevation: 3,
                    child: Column(
                      children: <Widget>[
                        if (_shopType == ShopType.departmental)
                          ..._cartItems.map((e) => InventoryItemWidget(
                              inventoryItem:
                                  Provider.of<DepartmentalItems>(context)
                                      .getInventoryItem(e['itemKey']),
                              orderType: _orderType)),
                      ],
                    ),
                  ),
                  SizedBox(height: unitSize * 5),
                  Card(
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: unitSize * 10, vertical: unitSize * 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Bill:',
                            textScaleFactor: unitSize,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: unitSize * 14,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Items Total:',
                                textScaleFactor: unitSize,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(fontWeight: FontWeight.normal),
                              ),
                              Text(
                                '₹ ${_currentItemsTotalPrice.toStringAsFixed(2)}',
                                textScaleFactor: unitSize,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: unitSize * 14,
                          ),
                          if ((_cartDetails['orderType'] ==
                                  OrderType.delivery) ||
                              _cartDetails['orderType'] ==
                                  OrderType.pickUpAndDelivery)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Delivery Fee:',
                                  textScaleFactor: unitSize,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontWeight: FontWeight.normal),
                                ),
                                Text(
                                  '₹ ${Price().getDeliveryFee.toStringAsFixed(2)}',
                                  textScaleFactor: unitSize,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          if ((_cartDetails['orderType'] ==
                                  OrderType.delivery) ||
                              _cartDetails['orderType'] ==
                                  OrderType.pickUpAndDelivery)
                            SizedBox(
                              height: unitSize * 14,
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'G.S.T (18 %)',
                                textScaleFactor: unitSize,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(fontWeight: FontWeight.normal),
                              ),
                              Text(
                                '₹ ${_gstPrice.toStringAsFixed(2)}',
                                textScaleFactor: unitSize,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: unitSize * 7,
                          ),
                          Divider(),
                          SizedBox(
                            height: unitSize * 7,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Net Total:',
                                textScaleFactor: unitSize,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                              Text(
                                '₹ ${_netTotalPrice.toStringAsFixed(2)}',
                                textScaleFactor: unitSize,
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
      persistentFooterButtons: _cartItems.length == 0
          ? null
          : <Widget>[
              CheckoutBar(
                cartDetails: _cartDetails,
              ),
            ],
    );
  }
}
