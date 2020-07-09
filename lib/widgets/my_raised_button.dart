import 'package:flutter/material.dart';

class MyRaisedButton extends StatelessWidget {
  final Function _exec;
  final String _title;

  MyRaisedButton(this._exec, this._title);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 10,
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Theme.of(context).accentColor),
          borderRadius: BorderRadius.circular(15)),
      onPressed: _exec,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          _title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      color: Theme.of(context).primaryColor,
    );
  }
}
