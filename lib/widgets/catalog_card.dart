import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/catalog.dart';

import '../pages/catalog_products.dart';

class CatalogCard extends StatelessWidget {
  final Catalog catalog;

  const CatalogCard({
    Key key,
    this.catalog,
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
              builder: (context) => CatalogProducts(catalog: catalog),
            ),
          );
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: new AssetImage(catalog.imageUrl),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.grey.withOpacity(0.5), BlendMode.darken
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                catalog.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 2
                    ..color = Colors.grey,
                ),
              ),
            ),
            //catalog.name.text.gray100.bold.size(22).makeCentered()
            Center(
              child: Text(
                catalog.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
