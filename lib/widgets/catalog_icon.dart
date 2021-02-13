import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/catalog.dart';
import 'package:jaisalmeria_handloom/pages/catalog_products.dart';


class CatalogIcon extends StatefulWidget {
  final Catalog catalog;

  const CatalogIcon({Key key, this.catalog}) : super(key: key);
  @override
  _CatalogIconState createState() => _CatalogIconState();
}

class _CatalogIconState extends State<CatalogIcon> {
    final List<String> categories = [
              '1.png',
              '40.png',
              '11.png',
              '33.png',
              '9.png',
              '5.png',
              '43.png',
              '31.png'
            ];
  final List<String> categoryTitle = [
              'Bedsheets',
              'Curtains',
              'Cushions',
              'Towels',
              'Covers',
              'Comfortors',
              'Mats',
              'Table Cloth'
            ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogProducts(catalog: widget.catalog)));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 65,
                        height: 65,
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index%2 == 0 ? index%3 != 0 ? index%4 == 0 ? Colors.green[100] : Colors.yellow[100] : Colors.pink[50] : Colors.blue[50],
                          border: Border.all(
                            color: Colors.white,
                          ),
                        ),
                        child: Container(
                          width: 55,
                          height: 55,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/categories/" + categories[index],
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          categoryTitle[index],
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: 'Regular',
                            color: Colors.black,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
  }
}