import 'package:flutter/material.dart';
import 'package:insti_shop/widgets/select_address_widget.dart';

class SelectAddressSheet {
  void showSelectAddressSheet(
    BuildContext context,
    double unitSize,
  ) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(unitSize * 25),
              topRight: Radius.circular(unitSize * 25)),
        ),
        context: context,
        builder: (_) {
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: SingleChildScrollView(child: SelectAddressWidget()));
        });
  }
}
