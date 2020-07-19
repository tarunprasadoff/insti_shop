import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/providers/profile.dart';
import 'package:insti_shop/widgets/icon_text_button.dart';
import 'package:insti_shop/widgets/my_snack_bar.dart';
import 'package:provider/provider.dart';

class AddAddressWidget extends StatefulWidget {
  @override
  _AddAddressWidgetState createState() => _AddAddressWidgetState();
}

class _AddAddressWidgetState extends State<AddAddressWidget> {
  Hostel hostelValue;
  String nameValue;
  String roomNoValue;

  void _updateValue(Hostel value) {
    hostelValue = value;
  }

  final _nameFocusNode = FocusNode();
  final _roomNoFocusNode = FocusNode();
  final _hostelFocusNode = FocusNode();

  @override
  void dispose() {
    _nameFocusNode.dispose();
    _roomNoFocusNode.dispose();
    _hostelFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);

    final _nameField = GlobalKey<FormState>();
    final _roomNoField = GlobalKey<FormState>();

    final TextStyle _hintStyle = TextStyle(
      fontSize: unitSize * 19,
    );
    final TextStyle _labelStyle = TextStyle(fontSize: unitSize * 17);
    final TextStyle _errorStyle =
        TextStyle(fontSize: unitSize * 12, color: Theme.of(context).errorColor);

    var _hostelSelectWidget = HostelSelectWidget(
      hostelFocusNode: _hostelFocusNode,
      hintStyle: _hintStyle,
      initialValue: hostelValue,
      updateValue: _updateValue,
    );

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: unitSize * 10),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: unitSize * 20,
          ),
          Text(
            'Add your Address',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontWeight: FontWeight.bold),
            textScaleFactor: unitSize,
          ),
          SizedBox(
            height: unitSize * 30,
          ),
          Container(
            height: unitSize * 100,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(unitSize * 8),
                  child: Card(
                    elevation: 1.5,
                    child: Container(
                      width: mediaQuery.width * 0.45,
                      child: Form(
                        key: _nameField,
                        child: TextFormField(
                          focusNode: _nameFocusNode,
                          style: _hintStyle,
                          decoration: InputDecoration(
                              focusColor: Theme.of(context).primaryColor,
                              fillColor: Colors.white,
                              labelStyle: _labelStyle,
                              hintStyle: _hintStyle,
                              errorStyle: _errorStyle,
                              prefixIcon: Icon(
                                Icons.person,
                                size: _hintStyle.fontSize,
                              ),
                              labelText: 'Your Name',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: unitSize * 1,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(unitSize * 8))),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            nameValue = value;
                            if (value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                          onFieldSubmitted: (_) {
                            _nameField.currentState.validate();
                            _nameField.currentState.save();
                            _roomNoFocusNode.requestFocus();
                          },
                          onSaved: (value) {},
                        ),
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(unitSize * 8),
                  child: Card(
                    elevation: 1.5,
                    child: Container(
                      width: mediaQuery.width * 0.45,
                      child: Form(
                        key: _roomNoField,
                        child: TextFormField(
                          focusNode: _roomNoFocusNode,
                          style: _hintStyle,
                          decoration: InputDecoration(
                              focusColor: Theme.of(context).primaryColor,
                              fillColor: Colors.white,
                              labelStyle: _labelStyle,
                              hintStyle: _hintStyle,
                              errorStyle: _errorStyle,
                              prefixIcon: Icon(
                                Icons.home,
                                size: _hintStyle.fontSize,
                              ),
                              labelText: 'Room No.',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    width: unitSize * 1,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(unitSize * 8))),
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            roomNoValue = value;
                            if (value.isEmpty) {
                              return 'Room No. Required';
                            }
                            if (int.tryParse(value) == null ||
                                int.parse(value) <= 0) {
                              return 'Invalid Room No.';
                            }
                            return null;
                          },
                          onFieldSubmitted: (_) {
                            _roomNoField.currentState.validate();
                            _nameField.currentState.validate();
                            _nameField.currentState.save();
                            _roomNoField.currentState.save();
                            _roomNoFocusNode.unfocus();
                            if (hostelValue == null) {
                              _hostelSelectWidget.openDropdown();
                            }
                          },
                          onSaved: (value) {},
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: unitSize * 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _hostelSelectWidget,
                IconTextButton(
                    icon: Icons.add,
                    onTap: () {
                      bool _condition = _nameField.currentState.validate() &
                          _roomNoField.currentState.validate();
                      if (hostelValue == null) {
                        MySnackBar().showSnackBar(
                            context: context,
                            title: 'Please enter your Hostel',
                            unitSize: unitSize,
                            color: Theme.of(context).errorColor);
                      } else if (_condition) {
                        Provider.of<Profile>(context, listen: false).addAddress(
                            Address(
                                name: nameValue,
                                roomNumber: int.parse(roomNoValue),
                                hostel: hostelValue));
                        Navigator.of(context).pop();
                        MySnackBar().showSnackBar(
                            context: context,
                            title: 'Address Added',
                            unitSize: unitSize);
                      }
                    },
                    title: 'Add New Address')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HostelSelectWidget extends StatefulWidget {
  HostelSelectWidget({
    Key key,
    @required FocusNode hostelFocusNode,
    @required TextStyle hintStyle,
    @required this.initialValue,
    @required this.updateValue,
  })  : _hostelFocusNode = hostelFocusNode,
        _hintStyle = hintStyle,
        super(key: key);

  final FocusNode _hostelFocusNode;
  final TextStyle _hintStyle;
  final Hostel initialValue;
  final Function updateValue;

  final GlobalKey _dropdownButtonKey = GlobalKey();

  void openDropdown() {
    _dropdownButtonKey.currentContext.visitChildElements((element) {
      if (element.widget != null && element.widget is Semantics) {
        element.visitChildElements((element) {
          if (element.widget != null && element.widget is Actions) {
            element.visitChildElements((element) {
              Actions.invoke(element, Intent(ActivateAction.key));
              return false;
            });
          }
        });
      }
    });
  }

  @override
  _HostelSelectWidgetState createState() => _HostelSelectWidgetState();
}

class _HostelSelectWidgetState extends State<HostelSelectWidget> {
  final Map<Hostel, String> _hostelDataList =
      Address(name: null, roomNumber: null, hostel: null).hostelDataList;

  Hostel dropDownValue;

  @override
  void initState() {
    dropDownValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);

    return ClipRRect(
      borderRadius: BorderRadius.circular(unitSize * 8),
      child: Card(
        elevation: 1.5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(unitSize * 8),
          side: BorderSide(
            width: unitSize * 1,
            color: Colors.grey,
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: unitSize * 8, horizontal: unitSize * 12),
          width: mediaQuery.width * 0.45,
          child: DropdownButton<Hostel>(
            key: widget._dropdownButtonKey,
            focusNode: widget._hostelFocusNode,
            hint: Text(
              'Select Hostel',
              style: TextStyle(
                fontSize: widget._hintStyle.fontSize,
                color: Colors.grey,
              ),
            ),
            focusColor: Theme.of(context).primaryColor,
            value: dropDownValue,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
            iconSize: widget._hintStyle.fontSize,
            style: TextStyle(
              fontSize: widget._hintStyle.fontSize,
              color: Theme.of(context).accentColor,
            ),
            underline: Container(
              height: 1 * unitSize,
              color: Colors.grey,
            ),
            onChanged: (Hostel newValue) {
              setState(() {
                dropDownValue = newValue;
              });
              widget.updateValue(newValue);
            },
            //onTap: () => widget._hostelFocusNode.requestFocus(),
            items: <Hostel>[...Hostel.values]
                .map<DropdownMenuItem<Hostel>>((Hostel value) {
              return DropdownMenuItem<Hostel>(
                value: value,
                child: Text(
                  _hostelDataList[value],
                  textScaleFactor: unitSize,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
