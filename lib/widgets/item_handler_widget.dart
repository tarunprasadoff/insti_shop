import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/models/type_manager.dart';

class ItemHandlerWidget extends StatefulWidget {
  const ItemHandlerWidget({
    @required this.itemKey,
    @required this.orderType,
    this.errorMessage,
    Key key,
  }) : super(key: key);

  final dynamic itemKey;
  final OrderType orderType;
  final String errorMessage;

  @override
  _ItemHandlerWidgetState createState() => _ItemHandlerWidgetState();
}

class _ItemHandlerWidgetState extends State<ItemHandlerWidget> {
  int itemCount = 0;

  void addItemCount() {
    setState(() {
      itemCount++;
    });
  }

  void minusItemCount() {
    if (itemCount != 0) {
      setState(() {
        itemCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    final double widgetHeight = unitSize * 34;
    final double borderThickness = unitSize * 2;
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderThickness + widgetHeight),
      child: Container(
          height: widgetHeight + borderThickness * 2,
          width: unitSize * 120,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    width: borderThickness,
                    color: Theme.of(context).accentColor),
                borderRadius: BorderRadius.circular(widgetHeight)),
          ),
          child: widget.errorMessage == null
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(widgetHeight),
                          topLeft: Radius.circular(widgetHeight),
                        ),
                        child: Container(
                          color: Theme.of(context).primaryColor,
                          child: InkWell(
                            child: Icon(
                              Icons.remove,
                              size: widgetHeight,
                              color: Colors.white,
                            ),
                            onTap: minusItemCount,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: unitSize * 8.0),
                      child: Text(
                        itemCount.toString(),
                        textScaleFactor: unitSize,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(widgetHeight),
                          topRight: Radius.circular(widgetHeight),
                        ),
                        child: Container(
                          color: Theme.of(context).primaryColor,
                          child: InkWell(
                            child: Icon(
                              Icons.add,
                              size: widgetHeight,
                              color: Colors.white,
                            ),
                            onTap: addItemCount,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(
                    widgetHeight,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(unitSize * 2),
                    color: Colors.white,
                    child: Center(
                      child: Text(
                        widget.errorMessage,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            .copyWith(color: Theme.of(context).accentColor),
                        textScaleFactor: unitSize,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))),
    );
  }
}
