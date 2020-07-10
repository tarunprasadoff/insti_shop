import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';

class MyLogo extends StatelessWidget {
  final double size;
  MyLogo({this.size});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    return ClipRRect(
      borderRadius: BorderRadius.circular(unitSize * 5),
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
