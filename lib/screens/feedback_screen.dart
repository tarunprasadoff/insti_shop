import 'package:flutter/material.dart';
import 'package:insti_shop/widgets/dummy_body.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';

class FeedbackScreen extends StatelessWidget {
  static const routeName = '/feedback_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar('Feedback'),
      body: DummyBody(
        'To Be Updated',
        isfullText: true,
      ),
    );
  }
}
