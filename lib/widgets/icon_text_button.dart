import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';

class IconTextButton extends StatelessWidget {
  IconTextButton({
    @required this.icon,
    @required this.onTap,
    @required this.title,
  });

  final Function onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    return RaisedButton(
      color: Colors.white,
      elevation: 3,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(unitSize * 6)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
            size: unitSize * 18,
          ),
          SizedBox(
            width: unitSize * 5,
          ),
          Text(
            title,
            textScaleFactor: unitSize,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
      onPressed: onTap,
      splashColor: Theme.of(context).primaryColor,
    );
  }
}
