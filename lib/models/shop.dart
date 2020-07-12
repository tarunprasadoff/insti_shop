import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:insti_shop/models/type_manager.dart';

class Shop {
  dynamic key;
  final ShopType type;
  String assetLink;
  final String title;
  String address;
  final String description;
  Map<OrderType, bool> orderTypeStatusMap;
  ClosedCommunity closedCommunity;

  Shop({
    this.key,
    @required this.title,
    @required this.type,
    this.address = 'IIT Madras',
    this.assetLink =
        'https://upload.wikimedia.org/wikipedia/commons/0/09/Dummy_flag.png',
    @required this.description,
    this.orderTypeStatusMap,
    this.closedCommunity = ClosedCommunity.iITMadras,
  }) {
    if (orderTypeStatusMap == null) {
      switch (type) {
        case ShopType.departmental:
          orderTypeStatusMap = {
            OrderType.atShopOrder: false,
            OrderType.delivery: false
          };
          break;
        case ShopType.food:
          orderTypeStatusMap = {
            OrderType.dineIn: false,
            OrderType.takeAway: false,
            OrderType.delivery: false
          };
          break;
        case ShopType.laundry:
          orderTypeStatusMap = {
            OrderType.atShopOrder: false,
            OrderType.pickUpAndDelivery: false
          };
          break;
        case ShopType.printing:
          orderTypeStatusMap = {
            OrderType.atShopOrder: false,
            OrderType.delivery: false
          };
          break;
        default:
      }
    }
    key =
        ValueKey(ShopKeyInput(title: title, closedCommunity: closedCommunity));
  }
}

class ShopKeyInput extends Equatable {
  final String title;
  final ClosedCommunity closedCommunity;
  ShopKeyInput({@required this.title, @required this.closedCommunity});

  @override
  // ignore: todo
  // TODO: implement props
  List<Object> get props => [title, closedCommunity];
}
