import 'package:flutter/material.dart';
import 'package:insti_shop/widgets/dummy_body.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';

class MyAddressesScreen extends StatelessWidget {
  static const routeName = '/my_addresses_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('My Addresses'),
      body: DummyBody('My Addresses'),
    );
  }
}
