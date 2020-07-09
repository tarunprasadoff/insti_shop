import 'package:flutter/material.dart';
import 'package:insti_shop/navigation/tab_navigator.dart';
import 'package:insti_shop/widgets/my_bottom_navigation_bar.dart';

class TabManager extends StatefulWidget {
  static const routeName = '/tab_manager';
  @override
  _TabManagerState createState() => _TabManagerState();
}

class _TabManagerState extends State<TabManager> {
  int _selectedPageIndex = 0;

  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
  };

  void _tabChoose(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async =>
          !await navigatorKeys[_selectedPageIndex].currentState.maybePop(),
      child: Scaffold(
          body: Stack(children: <Widget>[
            _buildOffstageNavigator(0),
            _buildOffstageNavigator(1),
            _buildOffstageNavigator(2),
            _buildOffstageNavigator(3),
          ]),
          bottomNavigationBar:
              MyBottomNavigationBar(_selectedPageIndex, _tabChoose)),
    );
  }

  Widget _buildOffstageNavigator(int index) {
    return Offstage(
      offstage: _selectedPageIndex != index,
      child: TabNavigator(
        navigatorKeys[index],
        index,
      ),
    );
  }
}
