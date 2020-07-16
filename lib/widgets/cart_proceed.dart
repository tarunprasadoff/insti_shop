import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/screens/cart_screen.dart';

class CartProceed extends StatelessWidget {
  const CartProceed({
    Key key,
    @required int currentCartItemsTotalCount,
    @required double currentCartItemsPriceTotal,
  })  : _currentCartItemsTotalCount = currentCartItemsTotalCount,
        _currentCartItemsPriceTotal = currentCartItemsPriceTotal,
        super(key: key);

  final int _currentCartItemsTotalCount;
  final double _currentCartItemsPriceTotal;

  @override
  Widget build(BuildContext context) {
    final Size mediaQuery = MediaQuery.of(context).size;
    final double unitSize = UnitSize().getUnitSize(mediaQuery);
    return Container(
      padding: EdgeInsets.only(
          left: unitSize * 18,
          top: unitSize * 5,
          right: unitSize * 6,
          bottom: unitSize * 5),
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: unitSize * 4, color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(unitSize * 40),
                  topLeft: Radius.circular(unitSize * 40)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '$_currentCartItemsTotalCount Item' +
                (_currentCartItemsTotalCount > 1 ? 's' : '') +
                '  |  ₹ ${_currentCartItemsPriceTotal.toStringAsFixed(2)}',
            textScaleFactor: unitSize,
            style: Theme.of(context).textTheme.bodyText2,
          ),
          FlatButton(
            splashColor: Theme.of(context).primaryColor,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.shopping_cart,
                  size: unitSize * 32,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: unitSize * 5,
                ),
                Text(
                  'Proceed',
                  textScaleFactor: unitSize,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ],
            ),
            onPressed: () {
              Navigator.of(context, rootNavigator: true)
                  .pushNamed(CartScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}
