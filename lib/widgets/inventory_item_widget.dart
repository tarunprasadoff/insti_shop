import 'package:flutter/material.dart';
import 'package:insti_shop/models/inventory_item.dart';
import 'package:insti_shop/general/general.dart';

class InventoryItemWidget extends StatelessWidget {
  final InventoryItem inventoryItem;
  InventoryItemWidget({@required this.inventoryItem});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: unitSize * 6),
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
          '₹ ${inventoryItem.price.toString()}',
          textScaleFactor: unitSize,
          style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold),
        ),
        trailing: IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        ),
      ),
    );
  }
}
