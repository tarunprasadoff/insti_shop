import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/navigation/tab_manager.dart';
import 'package:insti_shop/providers/profile.dart';

import 'package:insti_shop/widgets/my_app_bar.dart';
import 'package:insti_shop/widgets/my_logo.dart';
import 'package:insti_shop/widgets/my_raised_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  final _phonenoKey = GlobalKey<FormState>();
  final _otpKey = GlobalKey<FormState>();

  final _phonenoFocusNode = FocusNode();
  bool _labelphoneno = false;

  bool _preotp = true;
  bool _loginstate = true;

  bool _labelotp = false;
  final _otpFocusNode = FocusNode();

  bool _showpass = false;

  String _phoneNumberValue;
  String _otpValue;

  @override
  void initState() {
    _phonenoFocusNode.addListener(_phonenoDecoration);
    _otpFocusNode.addListener(_otpDecoration);
    super.initState();
  }

  void _phonenoDecoration() {
    setState(() {
      if (_phonenoFocusNode.hasFocus) {
        _labelphoneno = true;
      } else {
        _phonenoKey.currentState.validate();
      }
    });
  }

  void _otpDecoration() {
    setState(() {
      if (_otpFocusNode.hasFocus) {
        _labelotp = true;
      } else {
        _otpKey.currentState.validate();
      }
    });
  }

  @override
  void dispose() {
    _phonenoFocusNode.removeListener(_phonenoDecoration);
    _otpFocusNode.removeListener(_otpDecoration);
    _phonenoFocusNode.dispose();
    _otpFocusNode.dispose();
    super.dispose();
  }

  void _buttonAction() {
    setState(() {
      if (_preotp) {
        if (_phonenoKey.currentState.validate()) {
          setState(() {
            _preotp = false;
          });
        }
      } else {
        if (_form.currentState.validate()) {
          Provider.of<Profile>(context, listen: false)
              .setPhoneNumber(_phoneNumberValue);
          Navigator.of(context).pushReplacementNamed(TabManager.routeName);
        }
      }
    });
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

    final TextStyle _hintStyle = TextStyle(fontSize: unitSize * 19);
    final TextStyle _labelStyle = TextStyle(
        color: Theme.of(context).primaryColor, fontSize: unitSize * 15);
    final TextStyle _errorStyle =
        TextStyle(fontSize: unitSize * 12, color: Theme.of(context).errorColor);

    var _phoneno = Form(
        key: _phonenoKey,
        child: TextFormField(
          style: _formInputStyle,
          focusNode: _phonenoFocusNode,
          decoration: _labelphoneno
              ? InputDecoration(
                  labelText: 'Mobile Number:',
                  labelStyle: _labelStyle,
                  errorStyle: _errorStyle,
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Theme.of(context).primaryColor,
                    size: unitSize * Theme.of(context).iconTheme.size,
                  ))
              : InputDecoration(
                  hintText: 'Your Mobile Number',
                  hintStyle: _hintStyle,
                  errorStyle: _errorStyle,
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Theme.of(context).primaryColor,
                    size: unitSize * Theme.of(context).iconTheme.size,
                  )),
          textInputAction:
              _preotp ? TextInputAction.done : TextInputAction.next,
          keyboardType: TextInputType.phone,
          validator: (value) {
            _phoneNumberValue = value;
            if (value.isEmpty) {
              _labelphoneno = false;
              return 'Please enter your mobile number.';
            }
            if (value.length != 10) {
              return 'Please enter a valid mobile number.';
            }
            return null;
          },
          onFieldSubmitted: (_) {
            if (!_preotp) {
              FocusScope.of(context).requestFocus(_otpFocusNode);
            }
            _phonenoKey.currentState.validate();
          },
          onSaved: (value) {},
        ));

    var _otp = Form(
        key: _otpKey,
        child: TextFormField(
          style: _formInputStyle,
          focusNode: _otpFocusNode,
          decoration: _labelotp
              ? InputDecoration(
                  labelText: 'One-Time Password:',
                  labelStyle: _labelStyle,
                  errorStyle: _errorStyle,
                  prefixIcon: Icon(
                    Icons.security,
                    color: Theme.of(context).primaryColor,
                    size: unitSize * Theme.of(context).iconTheme.size,
                  ))
              : InputDecoration(
                  hintText: '6-digit OTP',
                  hintStyle: _hintStyle,
                  errorStyle: _errorStyle,
                  prefixIcon: Icon(
                    Icons.security,
                    color: Theme.of(context).primaryColor,
                    size: unitSize * Theme.of(context).iconTheme.size,
                  )),
          textInputAction: TextInputAction.done,
          obscureText: !_showpass,
          keyboardType: TextInputType.number,
          validator: (value) {
            _otpValue = value;
            if (value.isEmpty) {
              _labelotp = false;
              return 'Please enter One-Time Password.';
            }
            if (value.length != 6) {
              return 'Invalid One-Time Password.';
            }
            return null;
          },
          onFieldSubmitted: (_) => _form.currentState.validate(),
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
              if (_preotp) {
                setState(() {
                  _loginstate = !_loginstate;
                });
              }
            },
          ),
        ],
      );
    }

    return Scaffold(
      appBar: MyAppBar(_loginstate ? 'Login' : 'Sign-Up'),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: mediaQuery.height * 0.04,
              ),
              MyLogo(size: mediaQuery.width * 0.8),
              SizedBox(
                height: mediaQuery.height * 0.04,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).primaryColor,
                        width: unitSize * 1.5),
                    borderRadius: BorderRadius.circular(unitSize * 15)),
                elevation: 6,
                child: Container(
                  width: mediaQuery.width * 0.8,
                  padding: EdgeInsets.symmetric(
                      vertical: unitSize * 22, horizontal: unitSize * 15),
                  child: Center(
                    child: Form(
                      key: _form,
                      child: Column(
                        children: <Widget>[
                          _phoneno,
                          if (!_preotp)
                            SizedBox(
                              height: unitSize * 25,
                            ),
                          if (!_preotp) _otp,
                          if (!_preotp)
                            CheckboxListTile(
                              activeColor: Theme.of(context).primaryColor,
                              title: Text(
                                "Show Password",
                                textScaleFactor: unitSize,
                              ),
                              value: _showpass,
                              onChanged: (newValue) {
                                setState(() {
                                  _showpass = newValue;
                                });
                              },
                              controlAffinity: ListTileControlAffinity
                                  .leading, //  <-- leading Checkbox
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: mediaQuery.height * (_preotp ? 0.09 : .025),
              ),
              _preotp
                  ? (_loginstate
                      ? _buildBelowFormWidget(
                          'Don\'t have an account?', 'Sign-Up')
                      : _buildBelowFormWidget('Already Registered?', 'Login'))
                  : _buildBelowFormWidget('Didn\'t receive OTP?', 'Resend'),
              SizedBox(
                height: mediaQuery.height * (_preotp ? 0.09 : .02),
              ),
              MyRaisedButton(_buttonAction,
                  (_preotp ? 'Verify' : (_loginstate ? 'Login' : 'Sign-Up')))
            ],
          ),
        ),
      ),
    );
  }
}
