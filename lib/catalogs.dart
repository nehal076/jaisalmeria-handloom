import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/widgets/catalog_card.dart';

import 'models/catalog.dart';

class CatalogsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(80, 30, 80, 10),
            child: Text(
              'Catalogs',
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
            padding: const EdgeInsets.all(15.0),
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            children: allCatalogs.map((catalog) => CatalogCard(catalog: catalog)).toList(),
          ),
        ]
      ),
    );
  }
}
