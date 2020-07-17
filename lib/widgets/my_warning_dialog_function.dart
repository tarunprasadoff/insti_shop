import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyWarningDialogFunction {
  Function getMyWarningDialogFunction(BuildContext context, double unitSize) {
    return (String warningTitle, String warningContent) => showDialog(
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
                title: Text(warningTitle,
                    textScaleFactor: unitSize,
                    style: Theme.of(context).textTheme.headline1),
                content: Text(
                  warningContent,
                  textScaleFactor: unitSize,
                  style: TextStyle(fontSize: 17),
                ),
                actions: <Widget>[
                  FlatButton(
                      onPressed: () {
                        Navigator.of(ctx, rootNavigator: true).pop(false);
                      },
                      child: Text(
                        'No',
                        textScaleFactor: unitSize,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(color: Theme.of(context).primaryColor),
                      )),
                  FlatButton(
                      onPressed: () {
                        Navigator.of(ctx, rootNavigator: true).pop(true);
                      },
                      child: Text(
                        'Yes',
                        textScaleFactor: unitSize,
                        style: Theme.of(context)
                            .textTheme
                            .headline1
                            .copyWith(color: Theme.of(context).primaryColor),
                      )),
                ],
              ),
            ),
          ),
        );
  }
}
