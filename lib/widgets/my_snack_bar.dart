import 'package:flutter/material.dart';

class MySnackBar {
  void showSnackBar(
      {@required BuildContext context,
      @required String title,
      Color color,
      @required double unitSize}) {
    if (color == null) {
      color = Theme.of(context).primaryColor;
    }
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: Duration(seconds: 1, milliseconds: 500),
      shape: Border(
          top: BorderSide(
              width: unitSize * 1, color: Theme.of(context).accentColor)),
      content: Text(
        title,
        textScaleFactor: unitSize,
        style: Theme.of(context)
            .textTheme
            .caption
            .copyWith(fontWeight: FontWeight.bold, color: color),
      ),
      backgroundColor: Colors.white,
    ));
  }
}
