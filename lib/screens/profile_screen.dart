import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/providers/profile.dart';
import 'package:insti_shop/screens/feedback_screen.dart';
import 'package:insti_shop/screens/login_screen.dart';
import 'package:insti_shop/screens/my_addresses_screen.dart';
import 'package:insti_shop/screens/support_screen.dart';
import 'package:insti_shop/screens/terms_and_conditions_screen.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile_screen.dart';
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
                title: Text(
                  'My Mobile Number',
                  textScaleFactor: unitSize,
                  style: Theme.of(context).textTheme.bodyText2,
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
              Divider(
                color: Theme.of(context).accentColor,
              ),
              InkWell(
                child: ListTile(
                  title: Text(
                    'My Addresses',
                    textScaleFactor: unitSize,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(MyAddressesScreen.routeName);
                },
              ),
              Divider(
                color: Theme.of(context).accentColor,
              ),
              InkWell(
                child: ListTile(
                  title: Text(
                    'Support',
                    textScaleFactor: unitSize,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(SupportScreen.routeName);
                },
              ),
              Divider(
                color: Theme.of(context).accentColor,
              ),
              InkWell(
                child: ListTile(
                  title: Text(
                    'Feedback',
                    textScaleFactor: unitSize,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(FeedbackScreen.routeName);
                },
              ),
              Divider(
                color: Theme.of(context).accentColor,
              ),
              InkWell(
                child: ListTile(
                  title: Text(
                    'Terms and Conditions',
                    textScaleFactor: unitSize,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(TermsAndConditionsScreen.routeName);
                },
              ),
              Divider(
                color: Theme.of(context).accentColor,
              ),
              InkWell(
                child: ListTile(
                  title: Text(
                    'Sign Out',
                    textScaleFactor: unitSize,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .pushReplacementNamed(LoginScreen.routeName);
                },
              ),
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
