import 'package:flutter/material.dart';
import 'package:insti_shop/models/inventory_item.dart';
import 'package:insti_shop/models/shop.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/models/type_manager.dart';
import 'package:insti_shop/providers/cart.dart';
import 'package:insti_shop/providers/departmental_items.dart';
import 'package:insti_shop/widgets/cart_proceed.dart';
import 'package:insti_shop/widgets/dummy_body.dart';
import 'package:insti_shop/widgets/inventory_items_list_widget.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';
import 'package:insti_shop/widgets/my_shop_detail_image_stack.dart';
import 'package:provider/provider.dart';

class DepartmentalScreen extends StatelessWidget {
  static const routeName = '/departmental_screen';

  final Map<String, Object> _inputArguments;

  DepartmentalScreen(this._inputArguments);

  @override
  Widget build(BuildContext context) {
    final Shop _shop = _inputArguments['shop'];
    final OrderType _orderType = _inputArguments['orderType'];

    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    final double _imageHeight = mediaQuery.height * 0.25;

    final List<InventoryItem> _currentShopItems =
        Provider.of<DepartmentalItems>(context).getCurrentShopItems(_shop.key);
    final List<String> _categoriesList =
        Provider.of<DepartmentalItems>(context, listen: false)
            .getCurrentShopItemsListCategories(_currentShopItems);
    final _cartProvider = Provider.of<Cart>(context);
    final int _currentCartItemsTotalCount =
        _cartProvider.getCurrentOrderItemsTotalCount(_shop.key, _orderType);
    final double _currentCartItemsPriceTotal =
        _cartProvider.getDepartmentalItemsPriceTotal(_currentShopItems);

    Widget getScreenWidget(
        {Widget imageWidget,
        Widget noItemWidget,
        Widget itemListWidget,
        int itemListLength}) {
      return Container(
        width: mediaQuery.width,
        child: itemListLength != 0
            ? SingleChildScrollView(
                child: Column(
                children: <Widget>[imageWidget, itemListWidget],
              ))
            : Column(
                children: <Widget>[imageWidget, noItemWidget],
              ),
      );
    }

    return Scaffold(
      appBar: MyAppBar(_shop.title),
      body: getScreenWidget(
        imageWidget: MyShopDetailImageStack(
          shop: _shop,
          imageHeight: _imageHeight,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(unitSize * 15),
            bottomRight: Radius.circular(unitSize * 15),
          ),
        ),
        noItemWidget: Expanded(
            child: DummyBody(
          'No Items Available',
          isfullText: true,
        )),
        itemListLength: _currentShopItems.length,
        itemListWidget: InventoryItemsListWidget(
          categoriesList: _categoriesList,
          currentShopItems: _currentShopItems,
          orderType: _orderType,
        ),
      ),
      bottomNavigationBar: _currentCartItemsTotalCount == 0
          ? null
          : CartProceed(
              currentCartItemsTotalCount: _currentCartItemsTotalCount,
              currentCartItemsPriceTotal: _currentCartItemsPriceTotal),
    );
  }
}
