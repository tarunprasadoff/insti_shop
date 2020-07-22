import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/navigation/tab_manager.dart';
import 'package:insti_shop/providers/profile.dart';

import 'package:insti_shop/widgets/my_app_bar.dart';
import 'package:insti_shop/widgets/my_logo.dart';
import 'package:insti_shop/widgets/my_raised_button.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  static const routeName = '/otp_screen';
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<OtpScreen> {
  final _otpKey = GlobalKey<FormState>();

  final _otpFocusNode = FocusNode();

  String _otpValue;

  bool _showpass = false;

  bool loginState;
  String _phoneNo;

  @override
  void dispose() {
    _otpFocusNode.dispose();
    super.dispose();
  }

  void _buttonAction() {
    if (_otpKey.currentState.validate()) {
      Provider.of<Profile>(context, listen: false).setPhoneNumber(_phoneNo);
      Navigator.pushNamedAndRemoveUntil(
          context, TabManager.routeName, (r) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);

    final Map<String, Object> input =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    loginState = input['loginState'];
    _phoneNo = input['phoneNo'];

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

    var _otp = Form(
        key: _otpKey,
        child: TextFormField(
          obscureText: !_showpass,
          style: _formInputStyle,
          focusNode: _otpFocusNode,
          decoration: InputDecoration(
              focusColor: Theme.of(context).primaryColor,
              fillColor: Colors.white,
              labelStyle: _labelStyle,
              hintStyle: _hintStyle,
              errorStyle: _errorStyle,
              prefixIcon: Icon(
                Icons.security,
                color: Theme.of(context).primaryColor,
                size: unitSize * Theme.of(context).iconTheme.size,
              ),
              labelText: 'One-Time Password:',
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: unitSize * 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(unitSize * 18))),
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.phone,
          validator: (value) {
            _otpValue = value;
            if (value.isEmpty) {
              return 'Please enter One-Time Password.';
            }
            if (value.length != 6 || int.tryParse(value) == null) {
              return 'Invalid One-Time Password.';
            }
            return null;
          },
          onFieldSubmitted: (_) {
            _otpFocusNode.unfocus();
            _otpKey.currentState.validate();
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
            onPressed: () {},
          ),
        ],
      );
    }

    return Scaffold(
      appBar: MyAppBar('One-Time Password'),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(child: _otp),
                    CheckboxListTile(
                      activeColor: Theme.of(context).primaryColor,
                      title: Text(
                        "Show Password",
                        textScaleFactor: unitSize,
                        style: TextStyle(fontSize: 16),
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
              SizedBox(
                height: mediaQuery.height * (0.03),
              ),
              MyRaisedButton(_buttonAction, loginState ? 'Login' : 'Sign-Up'),
              SizedBox(
                height: mediaQuery.height * (0.03),
              ),
              _buildBelowFormWidget('Didn\'t receive OTP?', 'Resend'),
            ],
          ),
        ),
      ),
    );
  }
}
