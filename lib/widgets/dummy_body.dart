import 'package:flutter/material.dart';
import 'package:insti_shop/widgets/unit_size.dart';

class DummyBody extends StatelessWidget {
  final String _title;
  final bool isfullText;
  DummyBody(this._title, {this.isfullText: false});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    return Center(
      child: Padding(
        padding: EdgeInsets.all(unitSize * 25),
        child: Container(
          width: mediaQuery.width * 0.8,
          child: Row(
            children: <Widget>[
              Icon(
                Icons.info_outline,
                size: unitSize * Theme.of(context).iconTheme.size,
              ),
              SizedBox(
                width: mediaQuery.width * .05,
              ),
              Expanded(
                child: Text(
                  isfullText ? _title : 'This is the $_title Screen',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  softWrap: true,
                  textScaleFactor: unitSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
