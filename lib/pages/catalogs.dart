import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/catalog.dart';
import 'package:jaisalmeria_handloom/widgets/catalog_card.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class CatalogsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: Text('Shop By Category',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
        ),
        Padding(
          padding: const EdgeInsets.only(
              right: 8.0, top: 8.0, left: 8.0),
          child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text('View All',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pushNamed(context, '/categorise');
              }),
        )
      ],
    ),
      20.heightBox,
      Container(
         margin: EdgeInsets.symmetric(vertical: 4.0),
          height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: allCatalogs
          .map((catalog) => CatalogCard(catalog: catalog))
          .toList(),
        ),
      ),
      // GridView.count(
      //     shrinkWrap: true,
      //     physics: NeverScrollableScrollPhysics(),
      //     crossAxisCount: context.isMobile? 2 : 6,
      //     childAspectRatio: 1.0,
      //     mainAxisSpacing: 10.0,
      //     crossAxisSpacing: 10.0,
      //     children: allCatalogs
      //         .map((catalog) => CatalogCard(catalog: catalog))
      //         .toList(),
      //   ),
      ]).p16();
  }
}
