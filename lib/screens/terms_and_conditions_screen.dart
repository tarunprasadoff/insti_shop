import 'package:flutter/material.dart';
import 'package:insti_shop/widgets/dummy_body.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  static const routeName = '/terms_and_conditions_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Terms and Conditions'),
      body: DummyBody(
        'To Be Updated',
        isfullText: true,
      ),
    );
  }
}
