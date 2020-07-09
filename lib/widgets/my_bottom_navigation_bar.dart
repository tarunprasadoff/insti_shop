import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int _selectedPageIndex;
  final Function _tabChoose;
  static const double _borderRadius = 40.0;

  MyBottomNavigationBar(this._selectedPageIndex, this._tabChoose);

  static const List<String> _titles = ['Shop', 'Cart', 'Orders', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(width: 4, color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_borderRadius),
                  topLeft: Radius.circular(_borderRadius)))),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(_borderRadius + 3),
            topLeft: Radius.circular(_borderRadius + 3)),
        child: BottomNavigationBar(
            elevation: 0,
            iconSize: 32,
            selectedFontSize: 20,
            unselectedFontSize: 16,
            type: BottomNavigationBarType.fixed,
            onTap: _tabChoose,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.black54,
            selectedItemColor: Theme.of(context).primaryColor,
            currentIndex: _selectedPageIndex,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_basket), title: Text(_titles[0])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), title: Text(_titles[1])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.history), title: Text(_titles[2])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), title: Text(_titles[3])),
            ]),
      ),
    );
  }
}
