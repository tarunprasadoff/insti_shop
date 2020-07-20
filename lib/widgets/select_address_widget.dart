import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/providers/cart.dart';
import 'package:insti_shop/providers/profile.dart';
import 'package:insti_shop/screens/add_address_screen.dart';
import 'package:insti_shop/widgets/icon_text_button.dart';
import 'package:provider/provider.dart';

class SelectAddressWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);

    final Profile _profileProvider = Provider.of<Profile>(context);

    final Address _defaultAddress = _profileProvider.defaultAddress;
    final dynamic _defaultAddressKey = _profileProvider.defaultAddressKey;

    final List<Map<dynamic, Address>> _remainingAddressMapsList =
        _profileProvider.remainingAddresses;

    final Function _getAddressString = _profileProvider.getAddressString;

    int _addressIndex = 1;

    dynamic _deliveryAddressKey = Provider.of<Cart>(context).deliveryAddressKey;

    Widget buildAddressWidget(
        {String title, String address, dynamic key, bool isHighlight}) {
      return InkWell(
        onTap: () {
          Provider.of<Cart>(context, listen: false).setDeliveryAddressKey(key);
          Navigator.of(context).pop();
        },
        child: Container(
          width: mediaQuery.width * 0.40,
          height: mediaQuery.width * 0.40,
          decoration: ShapeDecoration(
            color: isHighlight ? Colors.deepPurple[50] : null,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(unitSize * 12),
                side: BorderSide(
                    color: isHighlight
                        ? Theme.of(context).primaryColor
                        : Colors.grey,
                    width: unitSize * 2.5)),
          ),
          child: Center(
            child: ListTile(
              title: Text(
                title,
                textScaleFactor: unitSize,
                style: Theme.of(context).textTheme.bodyText2,
              ),
              subtitle: Text(
                address,
                textScaleFactor: unitSize,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: unitSize * 20,
        ),
        Text(
          'Select Address:',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(fontWeight: FontWeight.bold),
          textScaleFactor: unitSize,
        ),
        SizedBox(
          height: unitSize * 15,
        ),
        Container(
          height: mediaQuery.width * 0.45,
          padding: EdgeInsets.symmetric(
              horizontal: unitSize * 15, vertical: unitSize * 15),
          child: Center(
            child: ListView(
              // controller: ScrollController(
              //     initialScrollOffset: Provider.of<Profile>(context)
              //                 .getIndexOfAddress(_deliveryAddressKey) *
              //             unitSize *
              //             15 +
              //         mediaQuery.width * .4),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    buildAddressWidget(
                        title: 'Default:',
                        address: _getAddressString(_defaultAddress),
                        key: _defaultAddressKey,
                        isHighlight: _deliveryAddressKey == _defaultAddressKey),
                    SizedBox(
                      width: unitSize * 15,
                    ),
                  ],
                ),
                ..._remainingAddressMapsList.map((e) {
                  _addressIndex++;
                  return Row(
                    children: <Widget>[
                      buildAddressWidget(
                          title: 'Address $_addressIndex:',
                          address: _getAddressString(e.values.toList()[0]),
                          key: e.keys.toList()[0],
                          isHighlight:
                              _deliveryAddressKey == e.keys.toList()[0]),
                      SizedBox(
                        width: unitSize * 15,
                      ),
                    ],
                  );
                }).toList(),
              ],
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
        SizedBox(
          height: unitSize * 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Or',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).accentColor),
              textScaleFactor: unitSize,
            ),
            SizedBox(
              width: unitSize * 40,
            ),
            IconTextButton(
                icon: Icons.add,
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pushNamed(AddAddressScreen.routeName,
                      arguments: {
                        'isCartAddressChange': true,
                        'editAddress': null,
                        'editAddressKey': null
                      });
                },
                title: 'Add New Address')
          ],
        ),
        SizedBox(
          height: unitSize * 20,
        ),
      ],
    );
  }
}
