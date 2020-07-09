import 'package:flutter/foundation.dart';
import 'package:insti_shop/models/type_manager.dart';

class Shop {
  final ShopType type;
  final String assetLink;
  final String title;
  final String address;
  bool dineIn;
  bool takeAway;
  bool delivery;
  bool atShopOrder;
  bool pickUpAndDelivery;
  final String description;

  Shop({
    @required this.title,
    @required this.type,
    this.address = 'IIT Madras',
    this.assetLink =
        'https://upload.wikimedia.org/wikipedia/commons/0/09/Dummy_flag.png',
    @required this.dineIn,
    @required this.takeAway,
    @required this.delivery,
    @required this.atShopOrder,
    @required this.pickUpAndDelivery,
    @required this.description,
  });
}
