import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/screens/otp_screen.dart';

import 'package:insti_shop/widgets/my_app_bar.dart';
import 'package:insti_shop/widgets/my_logo.dart';
import 'package:insti_shop/widgets/my_raised_button.dart';

class LoginScreen2 extends StatefulWidget {
  static const routeName = '/login_screen2';
  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  final _phonenoKey = GlobalKey<FormState>();

  final _phonenoFocusNode = FocusNode();

  bool loginState = true;

  String _phoneNumberValue;

  @override
  void dispose() {
    _phonenoFocusNode.dispose();
    super.dispose();
  }

  void _buttonAction() {
    if (_phonenoKey.currentState.validate()) {
      Navigator.of(context).pushNamed(OtpScreen.routeName,
          arguments: {'phoneNo': _phoneNumberValue, 'loginState': loginState});
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);

    final TextStyle _formInputStyle = Theme.of(context)
        .textTheme
        .bodyText1
        .copyWith(
            fontSize:
                Theme.of(context).textTheme.bodyText1.fontSize * unitSize);

    final TextStyle _hintStyle = TextStyle(fontSize: unitSize * 22);
    final TextStyle _labelStyle = TextStyle(
        color: Theme.of(context).primaryColor, fontSize: unitSize * 19);
    final TextStyle _errorStyle =
        TextStyle(fontSize: unitSize * 14, color: Theme.of(context).errorColor);

    var _phoneno = Form(
        key: _phonenoKey,
        child: TextFormField(
          style: _formInputStyle,
          focusNode: _phonenoFocusNode,
          decoration: InputDecoration(
              focusColor: Theme.of(context).primaryColor,
              fillColor: Colors.white,
              labelStyle: _labelStyle,
              hintStyle: _hintStyle,
              errorStyle: _errorStyle,
              prefixIcon: Icon(
                Icons.phone,
                color: Theme.of(context).primaryColor,
                size: unitSize * Theme.of(context).iconTheme.size,
              ),
              labelText: 'Mobile Number:',
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: unitSize * 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(unitSize * 18))),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.phone,
          validator: (value) {
            _phoneNumberValue = value;
            if (value.isEmpty) {
              return 'Please enter your mobile number.';
            }
            if (value.length != 10 || int.tryParse(value) == null) {
              return 'Please enter a valid mobile number.';
            }
            return null;
          },
          onFieldSubmitted: (_) {
            _phonenoFocusNode.unfocus();
            _phonenoKey.currentState.validate();
          },
          onSaved: (value) {},
        ));

    Widget _buildBelowFormWidget(String questionText, String buttonText) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            questionText,
            style: Theme.of(context).textTheme.bodyText2,
            textScaleFactor: unitSize,
          ),
          FlatButton(
            child: Text(
              buttonText,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 19),
              textScaleFactor: unitSize,
            ),
            onPressed: () {
              setState(() {
                loginState = !loginState;
              });
            },
          ),
        ],
      );
    }

    return Scaffold(
      appBar: MyAppBar(loginState ? 'Login' : 'Sign-Up'),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: mediaQuery.height * 0.075,
              ),
              MyLogo(size: mediaQuery.width * 0.9),
              SizedBox(
                height: mediaQuery.height * 0.075,
              ),
              Container(
                width: mediaQuery.width * 0.9,
                height: unitSize * 150,
                child: Container(child: _phoneno),
              ),
              SizedBox(
                height: mediaQuery.height * (0.03),
              ),
              MyRaisedButton(_buttonAction, ('Verify Number')),
              SizedBox(
                height: mediaQuery.height * (0.03),
              ),
              (loginState
                  ? _buildBelowFormWidget('Don\'t have an account?', 'Sign-Up')
                  : _buildBelowFormWidget('Already Registered?', 'Login')),
            ],
          ),
        ),
      ),
    );
  }
}
