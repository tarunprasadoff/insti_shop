import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/widgets/dummy_body.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile_screen.dart';
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    return Scaffold(
      appBar: MyAppBar('Profile'),
      body: DummyBody('Profile'),
    );
  }
}
