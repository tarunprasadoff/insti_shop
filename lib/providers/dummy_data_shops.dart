import 'package:flutter/cupertino.dart';
import 'package:insti_shop/models/shop.dart';
import 'package:insti_shop/models/type_manager.dart';

class DummyDataShops with ChangeNotifier {
  final List<Shop> shopList = [
    Shop(
      title: 'Prime Mart',
      type: ShopType.departmental,
      address: 'Students Facility Centre',
      assetLink:
          'https://content3.jdmagicbox.com/comp/chennai/g4/044pxx44.xx44.180327020233.h9g4/catalogue/prime-mart-adyar-chennai-supermarkets-a9z4fjija8.jpg',
      dineIn: false,
      takeAway: false,
      delivery: true,
      atShopOrder: true,
      pickUpAndDelivery: false,
      description: 'Freshers Kit Available',
    ),
    Shop(
      title: 'KK - Departmental',
      type: ShopType.departmental,
      address: 'Girls SFC',
      assetLink:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRMUAAzmg52WG_nMNqc_KY-h0g5waKBhBsrhA&usqp=CAU',
      dineIn: false,
      takeAway: false,
      delivery: false,
      atShopOrder: true,
      pickUpAndDelivery: false,
      description: 'Multipurpose',
    ),
    Shop(
      title: 'Anjappar',
      type: ShopType.food,
      address: 'Quark',
      assetLink:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcReYoY3lUvdrgzDZTwYoRAns0BbtoSHIfswDQ&usqp=CAU',
      dineIn: true,
      takeAway: true,
      delivery: true,
      atShopOrder: false,
      pickUpAndDelivery: false,
      description: 'Multi-Cuisine Restaurant',
    ),
    Shop(
      title: 'Cool Biz',
      type: ShopType.food,
      address: 'Himalaya',
      assetLink:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTP_J2uhF91WMsyZ5HjQLYYl2ZjxIob2ewODg&usqp=CAU',
      dineIn: true,
      takeAway: true,
      delivery: false,
      atShopOrder: false,
      pickUpAndDelivery: false,
      description: 'Juices, Fruits, Milkshakes and Desserts',
    ),
    Shop(
      title: 'Washdoor',
      type: ShopType.laundry,
      address: 'Students Facility Centre',
      assetLink:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTwKaayxoaHQXted5ODBgIHvfgZ33Z6RtfnYQ&usqp=CAU',
      dineIn: false,
      takeAway: false,
      delivery: false,
      atShopOrder: true,
      pickUpAndDelivery: true,
      description: '48-Hour Order Completion',
    ),
    Shop(
      title: 'Technographix',
      type: ShopType.printing,
      address: 'Students Facility Centre',
      assetLink:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ91W2NBtU2eJdijlEMG1Y5GkjTAc3JEBg4cg&usqp=CAU',
      dineIn: false,
      takeAway: false,
      delivery: true,
      atShopOrder: true,
      pickUpAndDelivery: false,
      description: 'Quality Printing',
    ),
  ];

  List<Shop> getShops(ShopType shopType, OrderType orderType) {
    // ignore: missing_return
    return shopList
        .where((element) =>
            TypeManager().getOrderTypeValidity(orderType, element, shopType))
        .toList();
  }
}
