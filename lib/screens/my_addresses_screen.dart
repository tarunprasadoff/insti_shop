import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/providers/cart.dart';
import 'package:insti_shop/providers/profile.dart';
import 'package:insti_shop/screens/add_address_screen.dart';
import 'package:insti_shop/widgets/icon_text_button.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';
import 'package:insti_shop/widgets/my_snack_bar.dart';
import 'package:insti_shop/widgets/my_warning_dialog_function.dart';
import 'package:provider/provider.dart';

class MyAddressesScreen extends StatelessWidget {
  static const routeName = '/my_addresses_screen';

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

    return Scaffold(
      appBar: MyAppBar('My Addresses'),
      body: _defaultAddressKey == null
          ? Center(
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AddAddressScreen.routeName,
                      arguments: {
                        'isCartAddressChange': false,
                        'editAddress': null,
                        'editAddressKey': null
                      });
                },
                child: Text(
                  '+ Add a New Address',
                  textScaleFactor: unitSize,
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: unitSize * 6, vertical: unitSize * 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Saved Addresses:',
                            textScaleFactor: unitSize,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: unitSize * 0,
                          ),
                        ],
                      ),
                      trailing: IconTextButton(
                          icon: Icons.add,
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                AddAddressScreen.routeName,
                                arguments: {
                                  'isCartAddressChange': false,
                                  'editAddress': null,
                                  'editAddressKey': null
                                });
                          },
                          title: 'New Address'),
                    ),
                    Divider(),
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Default Address:',
                            textScaleFactor: unitSize,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: unitSize * 10,
                          ),
                        ],
                      ),
                      subtitle: Text(
                        _getAddressString(_defaultAddress),
                        textScaleFactor: unitSize,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                      trailing: IconTextButton(
                          icon: Icons.edit,
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                AddAddressScreen.routeName,
                                arguments: {
                                  'isCartAddressChange': false,
                                  'editAddress': _defaultAddress,
                                  'editAddressKey': _defaultAddressKey
                                });
                          },
                          title: 'Edit'),
                    ),
                    Divider(
                      color: Theme.of(context).accentColor,
                    ),
                    ..._remainingAddressMapsList.map((e) {
                      _addressIndex++;
                      return Column(
                        children: <Widget>[
                          ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Address $_addressIndex:',
                                  textScaleFactor: unitSize,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                            subtitle: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: unitSize * 10,
                                ),
                                Text(
                                  _getAddressString(e.values.toList()[0]),
                                  textScaleFactor: unitSize,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontWeight: FontWeight.normal),
                                ),
                                SizedBox(
                                  height: unitSize * 15,
                                ),
                                Row(
                                  children: <Widget>[
                                    IconTextButton(
                                        icon: Icons.check,
                                        onTap: () {
                                          _profileProvider.setDefaultAddress(
                                              e.keys.toList()[0]);
                                          Provider.of<Cart>(context,
                                                  listen: false)
                                              .setDeliveryAddressKey(
                                                  e.keys.toList()[0]);
                                          MySnackBar().showSnackBar(
                                              context: context,
                                              title: 'Default Address Updated',
                                              unitSize: unitSize);
                                        },
                                        title: 'Set Default'),
                                    IconTextButton(
                                      icon: Icons.delete,
                                      onTap: () async {
                                        if (await MyWarningDialogFunction()
                                                .getMyWarningDialogFunction(
                                                    context, unitSize)(
                                            'Are you sure?',
                                            'The address will be removed.')) {
                                          _profileProvider.removeAddress(
                                              e.keys.toList()[0]);
                                          MySnackBar().showSnackBar(
                                            context: context,
                                            title: 'Address Deleted',
                                            unitSize: unitSize,
                                            color: Theme.of(context).errorColor,
                                          );
                                        }
                                      },
                                      title: 'Delete',
                                      color: Theme.of(context).errorColor,
                                    ),
                                  ],
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                )
                              ],
                            ),
                            trailing: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: unitSize * 6,
                                ),
                                IconTextButton(
                                    icon: Icons.edit,
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          AddAddressScreen.routeName,
                                          arguments: {
                                            'isCartAddressChange': false,
                                            'editAddress': e.values.toList()[0],
                                            'editAddressKey':
                                                e.keys.toList()[0],
                                          });
                                    },
                                    title: 'Edit'),
                              ],
                            ),
                          ),
                          Divider(
                            color: Theme.of(context).accentColor,
                          ),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
    );
  }
}
