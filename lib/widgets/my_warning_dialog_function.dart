import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWarningDialogFunction {
  Function getMyWarningDialogFunction(BuildContext context, double unitSize) {
    return (String warningMessage) => showDialog(
          barrierDismissible: false,
          context: context,
          builder: (ctx) => ClipRRect(
            borderRadius: BorderRadius.circular(unitSize * 6),
            child: WillPopScope(
              // ignore: missing_return
              onWillPop: () {
                Navigator.of(ctx, rootNavigator: true).pop(false);
              },
              child: AlertDialog(
                title: Text('Do you want to clear cart and add item?',
                    textScaleFactor: unitSize,
                    style: Theme.of(context).textTheme.headline1),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      warningMessage,
                      textScaleFactor: unitSize,
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(
                      height: unitSize * 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          child: FlatButton(
                              onPressed: () {
                                Navigator.of(ctx, rootNavigator: true)
                                    .pop(false);
                              },
                              child: Text(
                                'No',
                                textScaleFactor: unitSize,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              )),
                        ),
                        Expanded(
                          child: FlatButton(
                              onPressed: () {
                                Navigator.of(ctx, rootNavigator: true)
                                    .pop(true);
                              },
                              child: Text(
                                'Yes',
                                textScaleFactor: unitSize,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                        color: Theme.of(context).primaryColor),
                              )),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
