import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/widgets/dummy_body.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders_screen.dart';
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    return Scaffold(
      appBar: MyAppBar('Orders'),
      body: DummyBody('Orders'),
    );
  }
}
