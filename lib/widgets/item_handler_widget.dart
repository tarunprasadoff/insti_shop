import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/models/type_manager.dart';
import 'package:insti_shop/providers/dummy_data_shops.dart';
import 'package:insti_shop/widgets/my_warning_dialog_function.dart';
import 'package:provider/provider.dart';

class ItemHandlerWidget extends StatelessWidget {
  const ItemHandlerWidget({
    @required this.itemCount,
    @required this.itemKey,
    @required this.orderType,
    @required this.shopKey,
    this.errorMessage,
    @required this.handlerFunction,
    this.maxCount,
  });

  final dynamic itemKey;
  final OrderType orderType;
  final dynamic shopKey;
  final String errorMessage;
  final Function handlerFunction;
  final int itemCount;
  final int maxCount;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    final double widgetHeight = unitSize * 34;
    final double borderThickness = unitSize * 2;
    final bool isAddable = maxCount == null || itemCount < maxCount;
    final Color addButtonColor =
        isAddable ? Theme.of(context).primaryColor : Colors.grey;

    Function _getWarningDialog =
        MyWarningDialogFunction().getMyWarningDialogFunction(context, unitSize);

    void addItemCount() {
      if (isAddable) {
        handlerFunction(
            integralChange: 1,
            shop: Provider.of<DummyDataShops>(context, listen: false)
                .getShop(shopKey),
            itemOrderType: orderType,
            itemKey: itemKey,
            getWarningDialog: _getWarningDialog);
      }
    }

    void minusItemCount() {
      handlerFunction(
          integralChange: -1,
          shop: Provider.of<DummyDataShops>(context, listen: false)
              .getShop(shopKey),
          itemOrderType: orderType,
          itemKey: itemKey,
          getWarningDialog: _getWarningDialog);
    }

    Widget zeroHandlerWidget = InkWell(
      onTap: addItemCount,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(widgetHeight),
                topLeft: Radius.circular(widgetHeight),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: unitSize * 10.0),
                child: Text(
                  'Add',
                  textAlign: TextAlign.center,
                  textScaleFactor: unitSize,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ),
          VerticalDivider(
            color: Theme.of(context).accentColor,
            thickness: borderThickness,
            width: borderThickness,
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(widgetHeight),
              topRight: Radius.circular(widgetHeight),
            ),
            child: Container(
              width: unitSize * 40,
              color: addButtonColor,
              child: Icon(
                Icons.add,
                size: widgetHeight,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );

    Widget nonZeroHandlerWidget = Row(
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
          padding: EdgeInsets.symmetric(horizontal: unitSize * 10.0),
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
              color: addButtonColor,
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
    );

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
          child: errorMessage == null
              ? (itemCount == 0 ? zeroHandlerWidget : nonZeroHandlerWidget)
              : ClipRRect(
                  borderRadius: BorderRadius.circular(
                    widgetHeight,
                  ),
                  child: Container(
                    padding: EdgeInsets.all(unitSize * 2),
                    color: Theme.of(context).primaryColor,
                    child: Center(
                      child: Text(
                        errorMessage,
                        style: Theme.of(context).textTheme.caption,
                        textScaleFactor: unitSize,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ))),
    );
  }
}
