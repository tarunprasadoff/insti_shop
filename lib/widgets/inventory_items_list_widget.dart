import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/models/inventory_item.dart';
import 'package:insti_shop/models/type_manager.dart';
import 'package:insti_shop/providers/departmental_items.dart';
import 'package:provider/provider.dart';

import 'inventory_item_widget.dart';

class InventoryItemsListWidget extends StatelessWidget {
  const InventoryItemsListWidget({
    Key key,
    @required List<String> categoriesList,
    @required List<InventoryItem> currentShopItems,
    @required OrderType orderType,
  })  : _categoriesList = categoriesList,
        _currentShopItems = currentShopItems,
        _orderType = orderType,
        super(key: key);

  final List<String> _categoriesList;
  final List<InventoryItem> _currentShopItems;
  final OrderType _orderType;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    return Padding(
      padding: EdgeInsets.only(
        top: unitSize * 25,
      ),
      child: Column(
        children: <Widget>[
          ..._categoriesList.map((categoryName) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: unitSize * 22.5),
                  child: Text(
                    '$categoryName:',
                    textAlign: TextAlign.left,
                    textScaleFactor: unitSize,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                SizedBox(
                  height: unitSize * 10,
                ),
                ...Provider.of<DepartmentalItems>(context)
                    .getCategoryItemsList(categoryName, _currentShopItems)
                    .map((categoryItem) => InventoryItemWidget(
                          inventoryItem: categoryItem,
                          orderType: _orderType,
                        ))
                    .toList(),
                Divider(
                  color: Colors.black38,
                ),
                SizedBox(
                  height: unitSize * 25,
                )
              ],
            );
          }).toList()
        ],
      ),
    );
  }
}
