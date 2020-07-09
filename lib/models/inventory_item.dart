import 'package:flutter/foundation.dart';

class InventoryItem {
  final String title;
  final String description;
  final String itemCategory;
  final String shopName;
  final int availableQuantity;
  final double price;
  final bool isPriceMRP;

  InventoryItem({
    @required this.title,
    this.description,
    @required this.itemCategory,
    @required this.shopName,
    @required this.availableQuantity,
    @required this.price,
    @required this.isPriceMRP,
  });
}
