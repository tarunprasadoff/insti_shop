import 'package:flutter/material.dart';
import 'package:insti_shop/widgets/dummy_body.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';

class GenScreen extends StatelessWidget {
  static const routeName = '/gen_screen.dart';

  final String _store;

  GenScreen(this._store);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(_store),
      body: DummyBody(_store),
    );
  }
}
