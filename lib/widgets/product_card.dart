import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/catalog.dart';
import 'package:jaisalmeria_handloom/pages/product_detail.dart';

import '../catalog_products.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    Key key,
    this.product,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 15,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail()
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: new AssetImage(product.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
    );
  }
}