import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/providers/profile.dart';
import 'package:insti_shop/screens/feedback_screen.dart';
import 'package:insti_shop/screens/my_addresses_screen.dart';
import 'package:insti_shop/screens/support_screen.dart';
import 'package:insti_shop/screens/terms_and_conditions_screen.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

import 'login_screen2.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile_screen.dart';

  List<Widget> getProfileItem(
      {@required BuildContext context,
      @required String title,
      @required Function onTap,
      @required double unitSize}) {
    return <Widget>[
      Divider(
        color: Theme.of(context).accentColor,
      ),
      InkWell(
        child: ListTile(
          title: Text(
            title,
            textScaleFactor: unitSize,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        onTap: onTap,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    return Scaffold(
      appBar: MyAppBar('Profile'),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: unitSize * 6, vertical: unitSize * 10),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Padding(
                  padding: EdgeInsets.only(bottom: unitSize * 6),
                  child: Text(
                    'My Mobile Number',
                    textScaleFactor: unitSize,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                subtitle: Text(
                  Provider.of<Profile>(context).phoneNumber,
                  textScaleFactor: unitSize,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
              ...getProfileItem(
                  context: context,
                  unitSize: unitSize,
                  title: 'My Addresses',
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(MyAddressesScreen.routeName);
                  }),
              ...getProfileItem(
                  context: context,
                  title: 'Support',
                  onTap: () {
                    Navigator.of(context).pushNamed(SupportScreen.routeName);
                  },
                  unitSize: unitSize),
              ...getProfileItem(
                  context: context,
                  title: 'Feedback',
                  onTap: () {
                    Navigator.of(context).pushNamed(FeedbackScreen.routeName);
                  },
                  unitSize: unitSize),
              ...getProfileItem(
                  context: context,
                  title: 'Terms and Conditions',
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(TermsAndConditionsScreen.routeName);
                  },
                  unitSize: unitSize),
              ...getProfileItem(
                  context: context,
                  title: 'Sign Out',
                  onTap: () {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamedAndRemoveUntil(
                            LoginScreen2.routeName, (r) => false);
                  },
                  unitSize: unitSize),
              Divider(
                color: Theme.of(context).accentColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
