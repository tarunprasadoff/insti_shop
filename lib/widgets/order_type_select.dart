import 'package:flutter/material.dart';
import 'package:insti_shop/models/type_manager.dart';
import 'package:insti_shop/widgets/unit_size.dart';

class OrderTypeSelect {
  void getOrderTypeSelectSheet(
    BuildContext context,
    Size mediaQuery,
    ShopType _shopType,
    Function _exec,
  ) {
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(unitSize * 25),
              topRight: Radius.circular(unitSize * 25)),
        ),
        context: context,
        builder: (_) {
          final double _dividerHeight = unitSize * 4.0;
          double _itemHeight = mediaQuery.height * .08;
          List<OrderType> _orderTypeList =
              TypeManager().getOrderTypeList(_shopType);
          return GestureDetector(
              onTap: () {},
              behavior: HitTestBehavior.opaque,
              child: Container(
                height: _itemHeight * (_orderTypeList.length + 1) +
                    _dividerHeight * _orderTypeList.length,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      child: Center(
                        child: Text(
                          'Choose your Order Type:',
                          textScaleFactor: unitSize,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(color: Theme.of(context).primaryColor),
                        ),
                      ),
                      height: _itemHeight,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemBuilder: (_, i) => Container(
                          height: _itemHeight + _dividerHeight,
                          child: Column(
                            children: <Widget>[
                              Divider(
                                height: _dividerHeight,
                                color: Theme.of(context).accentColor,
                              ),
                              InkWell(
                                splashColor: Theme.of(context).primaryColor,
                                onTap: () {
                                  Navigator.of(context).pop();
                                  _exec(context, _orderTypeList[i]);
                                },
                                child: Container(
                                  height: _itemHeight,
                                  child: Center(
                                    child: ListTile(
                                      dense: true,
                                      leading: Icon(
                                        TypeManager().getOrderIconData(
                                            _orderTypeList[i], _shopType),
                                        color: Theme.of(context).primaryColor,
                                        size: _itemHeight * .6,
                                      ),
                                      title: Text(
                                        TypeManager().getOrderTypeString(
                                            _orderTypeList[i], _shopType),
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                        textScaleFactor: unitSize,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        itemCount: _orderTypeList.length,
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}
