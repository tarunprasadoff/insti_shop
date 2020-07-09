import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final _title;

  MyAppBar(this._title);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(width: 2, color: Theme.of(context).accentColor))),
      child: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor, //change your color here
        ),
        centerTitle: true,
        elevation: 4,
        //bottomOpacity: 0,
        //backgroundColor: Colors.transparent,
        title: Text(
          _title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
