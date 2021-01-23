import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/widgets/app_bar.dart';
import 'package:jaisalmeria_handloom/widgets/product_card.dart';

import '../models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogProducts extends StatelessWidget {
  final Catalog catalog;

  CatalogProducts({this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: ListView(
        children: [
          Text(
            catalog.name,
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
            padding: const EdgeInsets.all(5.0),
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            children: catalog.items.map((product) {
              return ProductCard(product: product, key: UniqueKey());
            }).toList(),
          ),
        ],
      ).p16(),
    );
  }
}
