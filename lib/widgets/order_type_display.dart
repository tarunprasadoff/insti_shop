import 'package:flutter/material.dart';
import 'package:insti_shop/models/type_manager.dart';
import 'package:insti_shop/widgets/order_type_select.dart';
import 'package:insti_shop/general/general.dart';

class OrderTypeDisplay extends StatelessWidget {
  final String _title;
  final ShopType _shopType;
  final IconData _icon;
  final Function _exec;
  OrderTypeDisplay(this._title, this._shopType, this._icon, this._exec);
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(unitSize * 25)),
      elevation: 0,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: unitSize * 6, horizontal: unitSize * 6),
        width: mediaQuery.width * 0.9,
        child: ListTile(
            leading: Icon(
              _icon,
              color: Theme.of(context).primaryColor,
              size: unitSize * Theme.of(context).iconTheme.size,
            ),
            title: Text(
              _title,
              //softWrap: true,
              style: TextStyle(fontWeight: FontWeight.bold),
              textScaleFactor: unitSize,
            ),
            trailing: RaisedButton(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(unitSize * 6)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.edit,
                    //size: mediaQuery.width * 0.045,
                    color: Theme.of(context).primaryColor,
                    size: unitSize * Theme.of(context).iconTheme.size,
                  ),
                  SizedBox(
                    width: unitSize * 5,
                  ),
                  Text(
                    'Edit',
                    textScaleFactor: unitSize,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                ],
              ),
              onPressed: () {
                OrderTypeSelect().getOrderTypeSelectSheet(
                    context, mediaQuery, _shopType, _exec);
              },
              splashColor: Theme.of(context).primaryColor,
            )),
      ),
    );
  }
}
