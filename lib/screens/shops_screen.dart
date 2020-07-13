import 'package:flutter/material.dart';
import 'package:insti_shop/general/general.dart';
import 'package:insti_shop/providers/dummy_data_shops.dart';
import 'package:insti_shop/models/type_manager.dart';
import 'package:insti_shop/widgets/dummy_body.dart';
import 'package:insti_shop/widgets/my_app_bar.dart';
import 'package:insti_shop/widgets/order_type_display.dart';
import 'package:insti_shop/widgets/shop_item.dart';
import 'package:provider/provider.dart';

class ShopsScreen extends StatefulWidget {
  final Map<String, Object> _types;

  ShopsScreen(this._types);

  static const routeName = '/shops_screen';

  @override
  _ShopsScreenState createState() => _ShopsScreenState();
}

class _ShopsScreenState extends State<ShopsScreen> {
  OrderType _orderType;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    _orderType = widget._types['orderType'];
    super.initState();
  }

  void _changeOrderType(_, _changedOrderType) {
    setState(() {
      _orderType = _changedOrderType;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    final ShopType _shopType = widget._types['shopType'];
    final String _title = TypeManager().getShopTypeString(_shopType);
    final String _orderTypeString =
        TypeManager().getOrderTypeString(_orderType, _shopType);
    final _shops =
        Provider.of<DummyDataShops>(context).getShops(_shopType, _orderType);
    //final String _title = ModalRoute.of(context).settings.arguments as String;
    return Scaffold(
      appBar: MyAppBar(_title),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: OrderTypeDisplay(
                _orderTypeString,
                _shopType,
                TypeManager().getOrderIconData(_orderType, _shopType),
                _changeOrderType),
            padding: EdgeInsets.only(
                top: unitSize * 20, left: unitSize * 15, bottom: unitSize * 10),
          ),
          _shops.length == 0
              ? Expanded(
                  child: DummyBody(
                    'No $_title Shops available for $_orderTypeString',
                    isfullText: true,
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    itemBuilder: (_, i) => ShopItem(_shops[i], _orderType),
                    itemCount: _shops.length,
                  ),
                ),
        ],
      ),
    );
  }
}
