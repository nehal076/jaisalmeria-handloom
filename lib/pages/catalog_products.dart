import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/widgets/app_bar.dart';
import 'package:jaisalmeria_handloom/widgets/product_card.dart';

import '../models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
          Container(
            margin: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 4.0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _buildFilterButton("SORT"),
                    Container(
                      color: Colors.black,
                      width: 2.0,
                      height: 24.0,
                    ),
                    _buildFilterButton("REFINE"),
                  ],
                ),
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: kIsWeb? 4 : 2,
            childAspectRatio: 0.7,
            padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
            children: catalog.items.map((product) {
              return ProductCard(product: product, key: UniqueKey());
            }).toList(),
          ),
        ],
      ).p16(),
    );
  }
}

_buildFilterButton(String title) {
    return InkWell(
      onTap: () {
        print(title);
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title),
        ],
      ),
    );
  }
