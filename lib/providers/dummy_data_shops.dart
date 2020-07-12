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
      description: 'Freshers Kit Available',
      orderTypeStatusMap: {
        OrderType.atShopOrder: true,
        OrderType.delivery: true
      },
    ),
    Shop(
        title: 'KK - Departmental',
        type: ShopType.departmental,
        address: 'Girls SFC',
        assetLink:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRMUAAzmg52WG_nMNqc_KY-h0g5waKBhBsrhA&usqp=CAU',
        description: 'Multipurpose',
        orderTypeStatusMap: {
          OrderType.atShopOrder: true,
          OrderType.delivery: false
        }),
    Shop(
        title: 'Anjappar',
        type: ShopType.food,
        address: 'Quark',
        assetLink:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcReYoY3lUvdrgzDZTwYoRAns0BbtoSHIfswDQ&usqp=CAU',
        description: 'Multi-Cuisine Restaurant',
        orderTypeStatusMap: {
          OrderType.dineIn: true,
          OrderType.takeAway: true,
          OrderType.delivery: true,
        }),
    Shop(
        title: 'Cool Biz',
        type: ShopType.food,
        address: 'Himalaya',
        assetLink:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTP_J2uhF91WMsyZ5HjQLYYl2ZjxIob2ewODg&usqp=CAU',
        description: 'Juices, Fruits, Milkshakes and Desserts',
        orderTypeStatusMap: {
          OrderType.dineIn: true,
          OrderType.takeAway: true,
          OrderType.delivery: false
        }),
    Shop(
        title: 'Washdoor',
        type: ShopType.laundry,
        address: 'Students Facility Centre',
        assetLink:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTwKaayxoaHQXted5ODBgIHvfgZ33Z6RtfnYQ&usqp=CAU',
        description: '48-Hour Order Completion',
        orderTypeStatusMap: {
          OrderType.atShopOrder: true,
          OrderType.pickUpAndDelivery: true,
        }),
    Shop(
        title: 'Technographix',
        type: ShopType.printing,
        address: 'Students Facility Centre',
        assetLink:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ91W2NBtU2eJdijlEMG1Y5GkjTAc3JEBg4cg&usqp=CAU',
        description: 'Quality Printing',
        orderTypeStatusMap: {
          OrderType.atShopOrder: true,
          OrderType.delivery: true,
        }),
  ];

  List<Shop> getShops(ShopType shopType, OrderType orderType) {
    // ignore: missing_return
    return shopList
        .where((element) =>
            TypeManager().getOrderTypeValidity(orderType, element, shopType))
        .toList();
  }
}
