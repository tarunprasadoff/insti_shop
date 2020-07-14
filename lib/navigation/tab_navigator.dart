import 'package:flutter/material.dart';
import 'package:insti_shop/screens/cart_screen.dart';
import 'package:insti_shop/screens/orders_screen.dart';
import 'package:insti_shop/screens/profile_screen.dart';
import 'package:insti_shop/screens/shop_type_select_screen.dart';
import 'package:insti_shop/screens/shops_screen.dart';

class TabNavigator extends StatelessWidget {
  TabNavigator(this._navigatorKey, this._index);
  final GlobalKey<NavigatorState> _navigatorKey;
  final int _index;

  Map<String, WidgetBuilder> _shopRouteBuilders(
      BuildContext context, Object arguments) {
    return {
      // ignore: missing_return
      '/': (context) {
        switch (_index) {
          case 0:
            return ShopTypeSelectScreen();
            break;
          case 1:
            return CartScreen();
            break;
          case 2:
            return OrdersScreen();
            break;
          case 3:
            return ProfileScreen();
            break;
          default:
        }
      },
      ShopsScreen.routeName: (context) => ShopsScreen(arguments),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
        key: _navigatorKey,
        // ignore: missing_return
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
              builder: (context) => _shopRouteBuilders(context,
                  routeSettings.arguments)[routeSettings.name](context));
        });
  }
}
