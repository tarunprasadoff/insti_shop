import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/models/shop.dart';
import 'package:insti_shop/models/type_manager.dart';

class Cart with ChangeNotifier {
  Map<String, Object> _cartDetails = {
    'shopKey': null,
    'orderType': null,
    'shopType': null
  };

  List<Map<String, Object>> _cartItems = [];

  List<Map<String, Object>> get cartItems {
    return [..._cartItems];
  }

  Map<String, Object> get cartDetails {
    return {..._cartDetails};
  }

  Future<bool> _getWarningDialog(BuildContext context, String warningMessage) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
          content: Text(
            '$warningMessage. Do you want to clear cart and add item?',
            textScaleFactor:
                UnitSize().getUnitSize(MediaQuery.of(context).size),
            style: Theme.of(context)
                .textTheme
                .caption
                .copyWith(color: Theme.of(context).accentColor),
          ),
          actions: <Widget>[
            FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop(false);
                },
                child: Text('No')),
            FlatButton(
                onPressed: () {
                  Navigator.of(ctx).pop(true);
                },
                child: Text('Yes'))
          ]),
    );
  }

  void _setCartDetails(OrderType orderType, Shop shop) {
    _cartDetails['shopKey'] = shop.key;
    _cartDetails['orderType'] = orderType;
    _cartDetails['shopType'] = shop.type;
  }

  Future<bool> _ifValid(
      OrderType orderType, Shop shop, BuildContext context) async {
    if (_cartDetails['shopKey'] == null ||
        _cartDetails['shopKey'] == shop.key) {
      if (_cartDetails['orderType'] == null ||
          _cartDetails['orderType'] == orderType) {
        _setCartDetails(orderType, shop);
        return true;
      } else {
        if (await _getWarningDialog(context,
            'Cart contains items from ${TypeManager().getOrderTypeString(orderType, shop.type)} order type from ${shop.title}.')) {
          _setCartDetails(orderType, shop);
          _cartItems = [];
          return true;
        } else {
          return false;
        }
      }
    } else {
      if (await _getWarningDialog(
          context, 'Cart contains items from ${shop.title} order type.')) {
        _setCartDetails(orderType, shop);
        _cartItems = [];
        return true;
      } else {
        return false;
      }
    }
  }

  Future<void> inventoryItemCountHandler(
      {BuildContext context,
      int integralChange,
      OrderType itemOrderType,
      Shop shop,
      dynamic itemKey}) async {
    if (await _ifValid(itemOrderType, shop, context)) {
      int itemIndex =
          _cartItems.indexWhere((element) => element['itemKey'] == itemKey);
      if (itemIndex != -1) {
        _cartItems[itemIndex]['quantity'] =
            (_cartItems[itemIndex]['quantity'] as int) + integralChange;
        _cartItems.removeWhere((element) => element['quantity'] == 0);
      } else {
        _cartItems.add({'itemKey': itemKey, 'quantity': 1});
      }
      print(_cartItems);
      print(_cartDetails);
    }
  }
}
