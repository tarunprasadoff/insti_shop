import 'package:flutter/material.dart';
import 'package:insti_shop/widgets/dummy_body.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart_screen.dart';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Cart'),
      body: DummyBody('Cart'),
    );
  }
}
