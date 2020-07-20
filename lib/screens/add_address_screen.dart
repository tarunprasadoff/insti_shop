import 'package:flutter/material.dart';
import 'package:insti_shop/providers/profile.dart';
import 'package:insti_shop/widgets/add_address_widget.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';

class AddAddressScreen extends StatelessWidget {
  static const routeName = '/add_address_screen';
  AddAddressScreen(this.inputMap);
  final Map<String, Object> inputMap;

  @override
  Widget build(BuildContext context) {
    final bool isCartAddressChange = inputMap['isCartAddressChange'];
    final Address editAddress = inputMap['editAddress'];
    final dynamic editAddressKey = inputMap['editAddressKey'];
    final String title =
        editAddressKey == null ? 'Add Address' : 'Edit Address';
    return Scaffold(
      appBar: MyAppBar(title),
      body: SingleChildScrollView(
        child: AddAddressWidget(
            isCartAddressChange: isCartAddressChange,
            editAddress: editAddress,
            editAddressKey: editAddressKey),
      ),
    );
  }
}
