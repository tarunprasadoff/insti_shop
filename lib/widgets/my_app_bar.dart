import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final _title;

  MyAppBar(this._title);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: unitSize * 2, color: Theme.of(context).accentColor))),
      child: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).accentColor, //change your color here
          size: unitSize * Theme.of(context).iconTheme.size,
        ),
        centerTitle: true,
        elevation: 4,
        //bottomOpacity: 0,
        //backgroundColor: Colors.transparent,
        title: Text(
          _title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline1,
          textScaleFactor: unitSize,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
