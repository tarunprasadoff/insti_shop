import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insti_shop/models/inventory_item.dart';
import 'package:insti_shop/models/shop.dart';
import 'package:insti_shop/models/type_manager.dart';

class Cart with ChangeNotifier {
  // ignore: unused_field
  final String _userPhoneNumber;

  Cart(this._userPhoneNumber) {
    print(_userPhoneNumber);
  }

  Map<String, Object> _cartDetails = {
    'shopKey': null,
    'orderType': null,
    'shopType': null
  };

  List<Map<String, Object>> _cartItems = [];

  List<Map<String, Object>> get cartItems {
    return [..._cartItems];
  }

  int getCurrentOrderItemsTotalCount(dynamic shopKey, OrderType orderType) {
    int sum = 0;
    if (shopKey == _cartDetails['shopKey'] &&
        orderType == _cartDetails['orderType']) {
      _cartItems.forEach((element) {
        sum += element['quantity'];
      });
    }
    return sum;
  }

  double getDepartmentalItemsPriceTotal(List<InventoryItem> currentShopItems) {
    double sum = 0;
    _cartItems.forEach((cartItem) {
      InventoryItem item = currentShopItems
          .firstWhere((element) => element.key == cartItem['itemKey']);
      sum += item.price * (item.isPriceMRP ? 100 / 118 : 1);
    });
    return sum;
  }

  Map<String, Object> get cartDetails {
    return {..._cartDetails};
  }

  int getQuantity(dynamic itemKey, OrderType orderType) {
    int itemIndex =
        _cartItems.indexWhere((element) => element['itemKey'] == itemKey);
    if (itemIndex == -1 || orderType != _cartDetails['orderType']) {
      return 0;
    } else {
      return _cartItems[itemIndex]['quantity'];
    }
  }

  void _setCartDetails(OrderType orderType, Shop shop) {
    _cartDetails['shopKey'] = shop.key;
    _cartDetails['orderType'] = orderType;
    _cartDetails['shopType'] = shop.type;
  }

  Future<bool> _ifValid(
      OrderType orderType, Shop shop, Function getWarningDialog) async {
    if (_cartItems.length == 0 || _cartDetails['shopKey'] == shop.key) {
      if (_cartItems.length == 0 || _cartDetails['orderType'] == orderType) {
        _setCartDetails(orderType, shop);
        return true;
      } else {
        if (await getWarningDialog(
            'Cart currently contains ${TypeManager().getOrderTypeString(orderType, shop.type)} items from ${shop.title}.')) {
          _setCartDetails(orderType, shop);
          _cartItems = [];
          return true;
        } else {
          return false;
        }
      }
    } else {
      if (await getWarningDialog(
          'Cart currently contains items from ${shop.title}.')) {
        _setCartDetails(orderType, shop);
        _cartItems = [];
        return true;
      } else {
        return false;
      }
    }
  }

  Future<void> inventoryItemCountHandler(
      {int integralChange,
      OrderType itemOrderType,
      Shop shop,
      dynamic itemKey,
      Function getWarningDialog}) async {
    if (await _ifValid(itemOrderType, shop, getWarningDialog)) {
      int itemIndex =
          _cartItems.indexWhere((element) => element['itemKey'] == itemKey);
      if (itemIndex != -1) {
        _cartItems[itemIndex]['quantity'] =
            (_cartItems[itemIndex]['quantity'] as int) + integralChange;
        _cartItems.removeWhere((element) => element['quantity'] == 0);
      } else {
        _cartItems.add({'itemKey': itemKey, 'quantity': 1});
      }
    }
    notifyListeners();
  }
}
