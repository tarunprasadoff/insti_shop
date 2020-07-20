import 'package:flutter/material.dart';
import 'package:insti_shop/screens/add_address_screen.dart';
import 'package:insti_shop/screens/cart_screen.dart';
import 'package:insti_shop/screens/feedback_screen.dart';
import 'package:insti_shop/screens/my_addresses_screen.dart';
import 'package:insti_shop/screens/orders_screen.dart';
import 'package:insti_shop/screens/profile_screen.dart';
import 'package:insti_shop/screens/shop_type_select_screen.dart';
import 'package:insti_shop/screens/shops_screen.dart';
import 'package:insti_shop/screens/support_screen.dart';
import 'package:insti_shop/screens/terms_and_conditions_screen.dart';

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
      TermsAndConditionsScreen.routeName: (context) =>
          TermsAndConditionsScreen(),
      SupportScreen.routeName: (context) => SupportScreen(),
      FeedbackScreen.routeName: (context) => FeedbackScreen(),
      MyAddressesScreen.routeName: (context) => MyAddressesScreen(),
      AddAddressScreen.routeName: (context) => AddAddressScreen(arguments),
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
