import 'package:flutter/material.dart';
import 'package:insti_shop/widgets/add_address_widget.dart';

class AddAddressSheet {
  void showAddAddressSheet(BuildContext context, double unitSize) {
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
              child: SingleChildScrollView(child: AddAddressWidget()));
        });
  }
}
