import 'package:flutter/material.dart';
import 'package:insti_shop/widgets/unit_size.dart';
import 'package:insti_shop/widgets/dummy_body.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen.dart';
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    return Scaffold(
      appBar: MyAppBar('Cart'),
      body: DummyBody('Cart'),
    );
  }
}
