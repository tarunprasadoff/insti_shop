import 'package:flutter/cupertino.dart';
import 'package:insti_shop/models/inventory_item.dart';
import 'package:insti_shop/models/shop.dart';
import 'package:insti_shop/models/type_manager.dart';

class DepartmentalItems with ChangeNotifier {
  final List<InventoryItem> departmentalItemsList = [
    InventoryItem(
        key: UniqueKey(),
        title: 'Colgate Toothpaste',
        itemCategory: 'Everyday',
        shopKey: ValueKey(ShopKeyInput(
            title: 'Prime Mart', closedCommunity: ClosedCommunity.iITMadras)),
        availableQuantity: 5,
        price: 30,
        isDeliverable: true,
        isPriceMRP: true),
    InventoryItem(
        key: UniqueKey(),
        title: 'Hammam Soap',
        itemCategory: 'Everyday',
        shopKey: ValueKey(ShopKeyInput(
            title: 'Prime Mart', closedCommunity: ClosedCommunity.iITMadras)),
        availableQuantity: 12,
        price: 20,
        isDeliverable: true,
        isPriceMRP: true),
    InventoryItem(
        key: UniqueKey(),
        title: 'Axe Deodorants',
        description: 'Pack of 3',
        itemCategory: 'Everyday',
        shopKey: ValueKey(ShopKeyInput(
            title: 'Prime Mart', closedCommunity: ClosedCommunity.iITMadras)),
        availableQuantity: 8,
        price: 450,
        isDeliverable: true,
        isPriceMRP: true),
    InventoryItem(
        key: UniqueKey(),
        title: 'Broomstick',
        itemCategory: 'Cleaning',
        shopKey: ValueKey(ShopKeyInput(
            title: 'Prime Mart', closedCommunity: ClosedCommunity.iITMadras)),
        availableQuantity: 10,
        price: 40,
        isDeliverable: false,
        isPriceMRP: false),
    InventoryItem(
        key: UniqueKey(),
        title: 'Mop Stick',
        itemCategory: 'Cleaning',
        shopKey: ValueKey(ShopKeyInput(
            title: 'Prime Mart', closedCommunity: ClosedCommunity.iITMadras)),
        availableQuantity: 4,
        price: 80,
        isDeliverable: false,
        isPriceMRP: false),
    InventoryItem(
        key: UniqueKey(),
        title: 'Lyzol Liquid',
        description: 'Buy 1 Get 1 Free',
        itemCategory: 'Cleaning',
        shopKey: ValueKey(ShopKeyInput(
            title: 'Prime Mart', closedCommunity: ClosedCommunity.iITMadras)),
        availableQuantity: 6,
        price: 120,
        isDeliverable: true,
        isPriceMRP: true),
  ];

  void removeInventoryItem(dynamic key) {
    departmentalItemsList.removeWhere((element) => element.key == key);
    notifyListeners();
  }

  String getAnyErrorMessage(InventoryItem inventoryItem, OrderType orderType) {
    return (orderType == OrderType.delivery
        ? (inventoryItem.isDeliverable ? null : 'Not Deliverable')
        : null);
  }

  List<InventoryItem> getCurrentShopItems(dynamic shopKey) {
    return departmentalItemsList
        .where((element) => element.shopKey == shopKey)
        .toList();
  }

  List<String> getCurrentShopItemsListCategories(
      List<InventoryItem> currentShopItemsList) {
    List<String> _categoriesList = [];
    currentShopItemsList.forEach((element) {
      String _currentItemCategory = element.itemCategory;
      if (!_categoriesList.contains(_currentItemCategory)) {
        _categoriesList.add(_currentItemCategory);
      }
    });
    _categoriesList.sort((a, b) {
      return a.toLowerCase().compareTo(b.toLowerCase());
    });
    return _categoriesList;
  }

  List<InventoryItem> getCategoryItemsList(
      String category, List<InventoryItem> currentShopItemsList) {
    final List<InventoryItem> _categoryItemsList = currentShopItemsList
        .where((element) => element.itemCategory == category)
        .toList();
    _categoryItemsList.sort((a, b) {
      return a.title.toLowerCase().compareTo(b.title.toLowerCase());
    });
    return _categoryItemsList;
  }

  InventoryItem getInventoryItem(dynamic key) {
    return departmentalItemsList.firstWhere((element) => element.key == key);
  }
}
