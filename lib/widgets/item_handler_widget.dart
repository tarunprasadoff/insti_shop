import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/models/type_manager.dart';
import 'package:insti_shop/providers/dummy_data_shops.dart';
import 'package:provider/provider.dart';

class ItemHandlerWidget extends StatefulWidget {
  const ItemHandlerWidget({
    @required this.itemKey,
    @required this.orderType,
    @required this.shopKey,
    this.errorMessage,
    @required this.handlerFunction,
    Key key,
  }) : super(key: key);

  final dynamic itemKey;
  final OrderType orderType;
  final dynamic shopKey;
  final String errorMessage;
  final Function handlerFunction;

  @override
  _ItemHandlerWidgetState createState() => _ItemHandlerWidgetState();
}

class _ItemHandlerWidgetState extends State<ItemHandlerWidget> {
  int itemCount = 0;

  void addItemCount() {
    widget.handlerFunction(
        context: context,
        integralChange: 1,
        shop: Provider.of<DummyDataShops>(context, listen: false)
            .getShop(widget.shopKey),
        itemOrderType: widget.orderType,
        itemKey: widget.itemKey);
    setState(() {
      itemCount++;
    });
  }

  void minusItemCount() {
    if (itemCount != 0) {
      widget.handlerFunction(
          context: context,
          integralChange: -1,
          shop: Provider.of<DummyDataShops>(context, listen: false)
              .getShop(widget.shopKey),
          itemOrderType: widget.orderType,
          itemKey: widget.itemKey);
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
                    VerticalDivider(
                      color: Theme.of(context).accentColor,
                      thickness: borderThickness,
                      width: borderThickness,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: unitSize * 10.0),
                      child: Text(
                        itemCount.toString(),
                        textScaleFactor: unitSize,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ),
                    VerticalDivider(
                      color: Theme.of(context).accentColor,
                      thickness: borderThickness,
                      width: borderThickness,
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
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Text(
                        widget.errorMessage,
                        style: Theme.of(context).textTheme.caption,
                        textScaleFactor: unitSize,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))),
    );
  }
}
