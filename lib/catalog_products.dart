import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/widgets/catalog_card.dart';
import 'package:jaisalmeria_handloom/widgets/product_card.dart';

import 'models/catalog.dart';

class CatalogProducts extends StatelessWidget {

  final Catalog catalog;

  CatalogProducts({this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(80, 30, 80, 10),
              child: Text(
                catalog.name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(5.0),
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              children: catalog.items.map((product) => ProductCard(product: product)).toList(),
            ),
          ]
        ),
      ),
    );
  }
}
