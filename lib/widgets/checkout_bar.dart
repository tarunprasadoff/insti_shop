import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/models/type_manager.dart';

class CheckoutBar extends StatelessWidget {
  CheckoutBar({
    Key key,
    @required Map<String, Object> cartDetails,
  })  : _cartDetails = cartDetails,
        super(key: key);

  final TypeManager _typeManager = TypeManager();
  final Map<String, Object> _cartDetails;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double unitSize = UnitSize().getUnitSize(mediaQuery);
    return Container(
      width: mediaQuery.width,
      child: ListTile(
          leading: Icon(
            _typeManager.getOrderIconData(
                _cartDetails['orderType'], _cartDetails['shopType']),
            color: Theme.of(context).primaryColor,
            size: unitSize * Theme.of(context).iconTheme.size,
          ),
          title: Text(
            _typeManager.getOrderTypeString(
                _cartDetails['orderType'], _cartDetails['shopType']),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            textScaleFactor: unitSize,
          ),
          trailing: RaisedButton(
            color: Theme.of(context).primaryColor,
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(unitSize * 6)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: unitSize * Theme.of(context).iconTheme.size,
                ),
                SizedBox(
                  width: unitSize * 5,
                ),
                Text(
                  'Checkout',
                  textScaleFactor: unitSize,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            onPressed: () {},
            splashColor: Theme.of(context).primaryColor,
          )),
    );
  }
}
