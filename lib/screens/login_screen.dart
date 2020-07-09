import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insti_shop/navigation/tab_manager.dart';

import 'package:insti_shop/widgets/my_app_bar.dart';
import 'package:insti_shop/widgets/my_logo.dart';
import 'package:insti_shop/widgets/my_raised_button.dart';

class LoginScreen extends StatefulWidget {
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
          Navigator.of(context).pushReplacementNamed(TabManager.routeName);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context).size;

    var _phoneno = Form(
        key: _phonenoKey,
        child: TextFormField(
          style: Theme.of(context).textTheme.bodyText1,
          focusNode: _phonenoFocusNode,
          decoration: _labelphoneno
              ? InputDecoration(
                  labelText: 'Mobile Number:',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Theme.of(context).primaryColor,
                  ))
              : InputDecoration(
                  hintText: 'Your Mobile Number',
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Theme.of(context).primaryColor,
                  )),
          textInputAction:
              _preotp ? TextInputAction.done : TextInputAction.next,
          keyboardType: TextInputType.phone,
          validator: (value) {
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
          style: Theme.of(context).textTheme.bodyText1,
          focusNode: _otpFocusNode,
          decoration: _labelotp
              ? InputDecoration(
                  labelText: 'One-Time Password:',
                  labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                  prefixIcon: Icon(
                    Icons.security,
                    color: Theme.of(context).primaryColor,
                  ))
              : InputDecoration(
                  hintText: '6-digit OTP',
                  prefixIcon: Icon(
                    Icons.security,
                    color: Theme.of(context).primaryColor,
                  )),
          textInputAction: TextInputAction.done,
          obscureText: !_showpass,
          keyboardType: TextInputType.number,
          validator: (value) {
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
          ),
          FlatButton(
            child: Text(
              buttonText,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 19),
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
                height: mediaquery.height * 0.07,
              ),
              MyLogo(size: mediaquery.width * 0.8),
              SizedBox(
                height: mediaquery.height * 0.05,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).primaryColor, width: 1.5),
                    borderRadius: BorderRadius.circular(15)),
                elevation: 6,
                child: Container(
                  width: mediaquery.width * 0.8,
                  padding: EdgeInsets.symmetric(vertical: 22, horizontal: 15),
                  child: Center(
                    child: Form(
                      key: _form,
                      child: Column(
                        children: <Widget>[
                          _phoneno,
                          if (!_preotp)
                            SizedBox(
                              height: 25,
                            ),
                          if (!_preotp) _otp,
                          if (!_preotp)
                            CheckboxListTile(
                              activeColor: Theme.of(context).primaryColor,
                              title: Text("Show Password"),
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
                height: mediaquery.height * (_preotp ? 0.09 : .025),
              ),
              _preotp
                  ? (_loginstate
                      ? _buildBelowFormWidget(
                          'Don\'t have an account?', 'Sign-Up')
                      : _buildBelowFormWidget('Already Registered?', 'Login'))
                  : _buildBelowFormWidget('Didn\'t receive OTP?', 'Resend'),
              SizedBox(
                height: mediaquery.height * (_preotp ? 0.09 : .02),
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
