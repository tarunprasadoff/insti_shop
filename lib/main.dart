import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:insti_shop/providers/cart.dart';
import 'package:insti_shop/providers/departmental_items.dart';
import 'package:insti_shop/providers/dummy_data_shops.dart';
import 'package:insti_shop/navigation/tab_manager.dart';
import 'package:insti_shop/providers/profile.dart';
import 'package:insti_shop/screens/cart_screen.dart';
import 'package:insti_shop/screens/departmental_screen.dart';
import 'package:insti_shop/screens/gen_screen.dart';

import 'package:insti_shop/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Profile(),
        ),
        ChangeNotifierProvider(
          create: (_) => DepartmentalItems(),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (_) => DummyDataShops(),
        builder: (context, _) => ChangeNotifierProvider(
          create: (_) => Cart(Provider.of<Profile>(context).phoneNumber),
          child: MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
                primaryColor: Color(0xff8372b4),
                primaryColorLight: Colors.deepPurple[200],
                accentColor: Colors.black,
                iconTheme: IconThemeData(size: 24),
                textTheme: TextTheme(
                  bodyText1: TextStyle(
                      color: Color(0xff8372b4), fontSize: 21, height: 1.4),
                  bodyText2: TextStyle(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.bold),
                  headline1: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  caption: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                )),
            home: TabManager(),
            routes: {
              TabManager.routeName: (_) => TabManager(),
            },
            // ignore: missing_return
            onGenerateRoute: (routeSettings) {
              switch (routeSettings.name) {
                case DepartmentalScreen.routeName:
                  return MaterialPageRoute(
                      builder: (context) =>
                          DepartmentalScreen(routeSettings.arguments));
                  break;
                case GenScreen.routeName:
                  return MaterialPageRoute(
                      builder: (context) => GenScreen(routeSettings.arguments));
                  break;
                case CartScreen.routeName:
                  return MaterialPageRoute(builder: (context) => CartScreen());
                  break;
                case LoginScreen.routeName:
                  return MaterialPageRoute(builder: (context) => LoginScreen());
                  break;
                default:
              }
            },
          ),
        ),
      ),
    );
  }
}
