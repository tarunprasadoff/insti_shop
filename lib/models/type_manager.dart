import 'package:flutter/material.dart';
import 'package:insti_shop/models/shop.dart';

enum ShopType { departmental, food, laundry, printing }

enum OrderType {
  dineIn,
  takeAway,
  delivery,
  atShopOrder,
  pickUpAndDelivery,
}

class TypeManager {
  // ignore: missing_return
  String getShopTypeString(ShopType shopType) {
    switch (shopType) {
      case ShopType.departmental:
        return 'Departmental';
        break;
      case ShopType.food:
        return 'Food';
        break;
      case ShopType.laundry:
        return 'Laundry';
        break;
      case ShopType.printing:
        return 'Printing';
        break;
      default:
    }
  }

  List<Map<String, Object>> get shopTypeAssetInfo {
    return [
      {
        'title': ShopType.departmental,
        'assetName': 'lib/assets/images/departmental.jpg'
      },
      {'title': ShopType.food, 'assetName': 'lib/assets/images/food.jpg'},
      {'title': ShopType.laundry, 'assetName': 'lib/assets/images/laundry.jpg'},
      {
        'title': ShopType.printing,
        'assetName': 'lib/assets/images/printing.jpg'
      }
    ];
  }

  // ignore: missing_return
  bool getOrderTypeValidity(OrderType orderType, Shop shop, ShopType shopType) {
    if (shop.type == shopType) {
      switch (orderType) {
        case OrderType.dineIn:
          return shop.dineIn;
          break;
        case OrderType.takeAway:
          return shop.takeAway;
          break;
        case OrderType.delivery:
          return shop.delivery;
          break;
        case OrderType.atShopOrder:
          return shop.atShopOrder;
          break;
        case OrderType.pickUpAndDelivery:
          return shop.pickUpAndDelivery;
          break;
        default:
      }
    } else {
      return false;
    }
  }

  // ignore: missing_return
  List<OrderType> getOrderTypeList(ShopType shopType) {
    switch (shopType) {
      case ShopType.departmental:
        return [OrderType.atShopOrder, OrderType.delivery];
        break;
      case ShopType.food:
        return [OrderType.dineIn, OrderType.takeAway, OrderType.delivery];
        break;
      case ShopType.laundry:
        return [OrderType.atShopOrder, OrderType.pickUpAndDelivery];
        break;
      case ShopType.printing:
        return [OrderType.atShopOrder, OrderType.delivery];
        break;
      default:
    }
  }

  // ignore: missing_return
  String getOrderTypeString(OrderType orderType, ShopType shopType) {
    switch (orderType) {
      case OrderType.dineIn:
        return 'Dine-In';
        break;
      case OrderType.takeAway:
        return 'Take Away';
        break;
      case OrderType.delivery:
        return 'Delivery';
        break;
      case OrderType.atShopOrder:
        if (shopType == ShopType.laundry) {
          return 'Direct Order';
        } else {
          return 'Pick-Up';
        }
        break;
      case OrderType.pickUpAndDelivery:
        return 'Pick-Up and Delivery';
        break;
      default:
    }
  }

  // ignore: missing_return
  IconData getOrderIconData(OrderType orderType, ShopType shopType) {
    switch (orderType) {
      case OrderType.dineIn:
        return Icons.restaurant;
        break;
      case OrderType.takeAway:
        return Icons.shopping_basket;
        break;
      case OrderType.delivery:
        return Icons.directions_bike;
        break;
      case OrderType.pickUpAndDelivery:
        return Icons.directions_bike;
        break;
      case OrderType.atShopOrder:
        switch (shopType) {
          case ShopType.laundry:
            return Icons.local_laundry_service;
            break;
          case ShopType.printing:
            return Icons.print;
            break;
          case ShopType.departmental:
            return Icons.account_balance_wallet;
            break;
          default:
        }
        break;
      default:
    }
  }
}
