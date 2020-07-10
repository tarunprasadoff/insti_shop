import 'package:flutter/material.dart';
import 'package:insti_shop/widgets/unit_size.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int _selectedPageIndex;
  final Function _tabChoose;

  MyBottomNavigationBar(this._selectedPageIndex, this._tabChoose);

  static const List<String> _titles = ['Shop', 'Cart', 'Orders', 'Profile'];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    final double _borderRadius = unitSize * 40.0;
    return Container(
      decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: unitSize * 4, color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(_borderRadius),
                  topLeft: Radius.circular(_borderRadius)))),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(_borderRadius + unitSize * 3),
            topLeft: Radius.circular(_borderRadius + unitSize * 3)),
        child: BottomNavigationBar(
            elevation: 0,
            iconSize: unitSize * 32,
            selectedFontSize: unitSize * 20,
            unselectedFontSize: unitSize * 16,
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
