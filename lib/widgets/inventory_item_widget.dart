import 'package:flutter/material.dart';
import 'package:insti_shop/models/inventory_item.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/models/type_manager.dart';
import 'package:insti_shop/providers/cart.dart';
import 'package:insti_shop/providers/departmental_items.dart';
import 'package:insti_shop/widgets/item_handler_widget.dart';
import 'package:provider/provider.dart';

class InventoryItemWidget extends StatelessWidget {
  final InventoryItem inventoryItem;
  final OrderType orderType;
  InventoryItemWidget({@required this.inventoryItem, @required this.orderType});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: unitSize * 10, horizontal: 12.5),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              inventoryItem.title,
              textScaleFactor: unitSize,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            if (inventoryItem.description != null)
              Padding(
                padding: EdgeInsets.only(top: unitSize * 4),
                child: Text(
                  inventoryItem.description,
                  textScaleFactor: unitSize,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: Theme.of(context).accentColor),
                ),
              ),
            SizedBox(
              height: unitSize * 6,
            ),
          ],
        ),
        subtitle: Text(
          '₹ ${(Price().getActualPrice(inventoryItem.price, inventoryItem.isPriceMRP)).toStringAsFixed(2)}',
          textScaleFactor: unitSize,
          style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold),
        ),
        trailing: ItemHandlerWidget(
          itemCount: Provider.of<Cart>(context)
              .getQuantity(inventoryItem.key, orderType),
          itemKey: inventoryItem.key,
          orderType: orderType,
          shopKey: inventoryItem.shopKey,
          errorMessage: Provider.of<DepartmentalItems>(context)
              .getAnyErrorMessage(inventoryItem, orderType),
          handlerFunction: Provider.of<Cart>(context, listen: false)
              .inventoryItemCountHandler,
          maxCount: inventoryItem.availableQuantity,
        ),
      ),
    );
  }
}
