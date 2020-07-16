import 'dart:ui';

import 'package:insti_shop/models/type_manager.dart';

class UnitSize {
  double getUnitSize(Size mediaQuery) {
    return mediaQuery.height / 737.45;
  }
}

class Price {
  static const double taxRate = 18;
  static const double deliveryFee = 15;

  double get getDeliveryFee {
    return deliveryFee;
  }

  double getActualPrice(double price, bool isPriceMRP) {
    return (isPriceMRP ? price * 100 / (100 + taxRate) : price);
  }

  double getGSTPrice(double price, OrderType orderType) {
    return (price +
            ((orderType == OrderType.delivery ||
                    orderType == OrderType.pickUpAndDelivery)
                ? deliveryFee
                : 0)) *
        taxRate /
        100;
  }

  double getNetTotalPrice(double price, OrderType orderType) {
    return (price +
            ((orderType == OrderType.delivery ||
                    orderType == OrderType.pickUpAndDelivery)
                ? deliveryFee
                : 0)) *
        (100 + taxRate) /
        100;
  }
}
