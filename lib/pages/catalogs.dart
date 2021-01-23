import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/catalog.dart';
import 'package:jaisalmeria_handloom/widgets/catalog_card.dart';

class CatalogsPage extends StatelessWidget {
  static final dataKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        'Catalogs',
        textScaleFactor: 2.0,
        style: TextStyle(
          fontWeight: FontWeight.w900,
        ),
      ),
      20.heightBox,
      GridView.count(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        children: allCatalogs
            .map((catalog) => CatalogCard(catalog: catalog))
            .toList(),
      ),
    ]).p16();
  }
}
