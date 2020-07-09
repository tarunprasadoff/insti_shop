import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  final double size;
  MyLogo({this.size});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: size,
        child: Material(
          elevation: 5,
          child: Image.asset('lib/assets/images/logo.jpg'),
        ),
      ),
    );
  }
}
