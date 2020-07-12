import 'package:flutter/cupertino.dart';
import 'package:insti_shop/models/inventory_item.dart';
import 'package:insti_shop/models/shop.dart';
import 'package:insti_shop/models/type_manager.dart';

class DepartmentalItems with ChangeNotifier {
  final List<InventoryItem> departmentalItemsList = [
    InventoryItem(
        title: 'Colgate Toothpaste',
        itemCategory: 'Everyday',
        shopKey: ValueKey(ShopKeyInput(
            title: 'Prime Mart', closedCommunity: ClosedCommunity.iITMadras)),
        availableQuantity: 5,
        price: 30,
        isPriceMRP: true),
    InventoryItem(
        title: 'Hammam Soap',
        itemCategory: 'Everyday',
        shopKey: ValueKey(ShopKeyInput(
            title: 'Prime Mart', closedCommunity: ClosedCommunity.iITMadras)),
        availableQuantity: 12,
        price: 20,
        isPriceMRP: true),
    InventoryItem(
        title: 'Axe Deodorants',
        description: 'Pack of 3',
        itemCategory: 'Everyday',
        shopKey: ValueKey(ShopKeyInput(
            title: 'Prime Mart', closedCommunity: ClosedCommunity.iITMadras)),
        availableQuantity: 8,
        price: 450,
        isPriceMRP: true),
    InventoryItem(
        title: 'Broomstick',
        itemCategory: 'Cleaning',
        shopKey: ValueKey(ShopKeyInput(
            title: 'Prime Mart', closedCommunity: ClosedCommunity.iITMadras)),
        availableQuantity: 10,
        price: 40,
        isPriceMRP: false),
    InventoryItem(
        title: 'Mop Stick',
        itemCategory: 'Cleaning',
        shopKey: ValueKey(ShopKeyInput(
            title: 'Prime Mart', closedCommunity: ClosedCommunity.iITMadras)),
        availableQuantity: 4,
        price: 80,
        isPriceMRP: false),
    InventoryItem(
        title: 'Lyzol Liquid',
        description: 'Buy 1 Get 1 Free',
        itemCategory: 'Cleaning',
        shopKey: ValueKey(ShopKeyInput(
            title: 'Prime Mart', closedCommunity: ClosedCommunity.iITMadras)),
        availableQuantity: 6,
        price: 120,
        isPriceMRP: true),
  ];

  void removeInventoryItem(String title) {
    departmentalItemsList.removeWhere((element) => element.title == title);
    notifyListeners();
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
}
