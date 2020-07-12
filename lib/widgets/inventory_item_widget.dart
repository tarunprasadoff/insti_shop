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
          '₹ ${inventoryItem.price.toString()}',
          textScaleFactor: unitSize,
          style: TextStyle(
              fontSize: 16,
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold),
        ),
        trailing: ClipRRect(
          borderRadius: BorderRadius.circular(unitSize * 27),
          child: Container(
            width: unitSize * 100,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: unitSize * 2,
                      color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(unitSize * 25)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: unitSize * 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(unitSize * 25),
                        topLeft: Radius.circular(unitSize * 25),
                      ),
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        child: InkWell(
                          child: Icon(
                            Icons.add,
                            size: 25 * unitSize,
                            color: Colors.white,
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: unitSize * 8.0),
                    child: Text(
                      '1',
                      textScaleFactor: unitSize,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(unitSize * 25),
                        topRight: Radius.circular(unitSize * 25),
                      ),
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        child: InkWell(
                          child: Icon(
                            Icons.remove,
                            size: 25 * unitSize,
                            color: Colors.white,
                          ),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
