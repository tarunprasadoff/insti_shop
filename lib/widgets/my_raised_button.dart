import 'package:flutter/material.dart';
import 'package:insti_shop/widgets/unit_size.dart';

class MyRaisedButton extends StatelessWidget {
  final Function _exec;
  final String _title;

  MyRaisedButton(this._exec, this._title);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    return RaisedButton(
      elevation: 10,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              width: unitSize * 2, color: Theme.of(context).accentColor),
          borderRadius: BorderRadius.circular(unitSize * 15)),
      onPressed: _exec,
      child: Padding(
        padding: EdgeInsets.all(unitSize * 10),
        child: Text(
          _title,
          style: Theme.of(context).textTheme.headline1,
          textScaleFactor: unitSize,
        ),
      ),
      color: Theme.of(context).primaryColor,
    );
  }
}
