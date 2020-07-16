import 'package:flutter/material.dart';
import 'package:insti_shop/models/type_manager.dart';
import 'package:insti_shop/widgets/order_type_select.dart';
import 'package:insti_shop/general/general.dart';

class OrderTypeDisplay extends StatelessWidget {
  final String _title;
  final ShopType _shopType;
  final IconData _icon;
  final Function _exec;
  final bool isFinal;
  OrderTypeDisplay(this._title, this._shopType, this._icon, this._exec,
      {this.isFinal = false});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    return Padding(
      padding: EdgeInsets.only(
          top: unitSize * 20,
          left: unitSize * 15,
          right: unitSize * 15,
          bottom: unitSize * 10),
      child: Card(
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                textScaleFactor: unitSize,
              ),
              trailing: isFinal
                  ? null
                  : RaisedButton(
                      color: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(unitSize * 6)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.edit,
                            color: Theme.of(context).primaryColor,
                            size: unitSize * 18,
                          ),
                          SizedBox(
                            width: unitSize * 5,
                          ),
                          Text(
                            'Change',
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
      ),
    );
  }
}
