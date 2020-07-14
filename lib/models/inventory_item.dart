import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class InventoryItem {
  dynamic key;
  String title;
  String description;
  String itemCategory;
  int availableQuantity;
  double price;
  bool isPriceMRP;
  final dynamic shopKey;
  bool isDeliverable;

  InventoryItem({
    @required this.key,
    @required this.title,
    this.description,
    @required this.itemCategory,
    @required this.shopKey,
    @required this.availableQuantity,
    @required this.price,
    @required this.isPriceMRP,
    @required this.isDeliverable,
  });
}
