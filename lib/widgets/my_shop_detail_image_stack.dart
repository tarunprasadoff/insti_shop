import 'package:flutter/material.dart';
import 'package:insti_shop/models/shop.dart';
import 'package:insti_shop/general/general.dart';

class MyShopDetailImageStack extends StatelessWidget {
  final Shop shop;
  final double imageHeight;
  final BorderRadius borderRadius;
  MyShopDetailImageStack({this.shop, this.imageHeight, this.borderRadius});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final unitSize = UnitSize().getUnitSize(mediaQuery);
    return Stack(children: <Widget>[
      ClipRRect(
        child: Image.network(
          shop.assetLink,
          height: imageHeight,
          width: double.infinity,
          fit: BoxFit.cover,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Container(
              height: imageHeight,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColorLight),
                ),
              ),
            );
          },
        ),
        borderRadius: borderRadius,
      ),
      Positioned(
        bottom: unitSize * 20,
        left: unitSize * 20,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(unitSize * 8),
          child: Container(
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.symmetric(
                horizontal: unitSize * 10, vertical: unitSize * 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  shop.title,
                  style: Theme.of(context).textTheme.headline1.copyWith(
                        color: Theme.of(context).primaryColorLight,
                      ),
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  textScaleFactor: unitSize,
                ),
                Text(
                  shop.address,
                  style: Theme.of(context).textTheme.caption,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  textAlign: TextAlign.left,
                  textScaleFactor: unitSize,
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }
}
