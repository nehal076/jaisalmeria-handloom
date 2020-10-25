import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/catalog_products.dart';

class CatalogsPage extends StatelessWidget {
  final myImageAndCaption = [
    ['assets/catalog/bedsheet.jpg', 'Bedsheets'],
    ['assets/catalog/comforter.jpg', 'Comforters'],
    ['assets/catalog/curtain.jpg', 'Curtains'],
    [ 'assets/catalog/cushion.jpg',  'Cushions'],
    ['assets/catalog/towels.jpg','Towels'],
    ['assets/catalog/fridgecover.jpg','Fridge Covers'],
  ];
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
          Stack(
            children: [
              GridView.count(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1.0,
                  padding: const EdgeInsets.all(15.0),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  children: myImageAndCaption.map((url) => Card(
                      elevation: 15,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(
                              context, MaterialPageRoute(
                              builder: (context)=>CatalogProducts(url.last),
                            )
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: new AssetImage(url.first), fit: BoxFit.cover
                                )
                              ),
                            ),
                            Container(
                              child: Center(
                                  child: Text(
                                    url.last,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        shadows: [
                                          Shadow(offset: Offset(-0.5, -0.5),color: Colors.white),
                                          Shadow(offset: Offset(0.5, -0.5),color: Colors.white),
                                          Shadow(offset: Offset(0.5, 0.5),color: Colors.white),
                                          Shadow(offset: Offset(-0.5, 0.5),color: Colors.white),
                                        ]
                                    ),
                                  )
                              ),
                            ),
                          ],
                        ),
                      )
                    )
                  ).toList()
              ),
            ],
          ),
        ],
      ),
    );
  }
}