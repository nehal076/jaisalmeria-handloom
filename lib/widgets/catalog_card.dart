import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/catalog.dart';

import '../pages/catalog_products.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogCard extends StatelessWidget {
  final Catalog catalog;

  const CatalogCard({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CatalogProducts(catalog: catalog),
            ),
          );
        },
        child: VxAnimatedBox(
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: catalog.name.text.white.semiBold
                        .make()
                        .box
                        .withDecoration(BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Vx.green500, Vx.teal500]),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                            )))
                        .p8
                        .make()))
            .bgImage(DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  catalog.imageUrl,
                )))
            .rounded
            .shadowMd
            .make()

        //  Stack(
        //   children: [
        //     Container(
        //       decoration: BoxDecoration(
        //         image: DecorationImage(
        //           image: new AssetImage(catalog.imageUrl),
        //           fit: BoxFit.cover,
        //           colorFilter: ColorFilter.mode(
        //               Colors.grey.withOpacity(0.5), BlendMode.darken),
        //         ),
        //       ),
        //     ),
        //     Center(
        //       child: Text(
        //         catalog.name,
        //         textAlign: TextAlign.center,
        //         style: TextStyle(
        //           fontSize: 22,
        //           fontWeight: FontWeight.bold,
        //           foreground: Paint()
        //             ..style = PaintingStyle.stroke
        //             ..strokeWidth = 2
        //             ..color = Colors.grey,
        //         ),
        //       ),
        //     ),
        //     //catalog.name.text.gray100.bold.size(22).makeCentered()
        //     Center(
        //       child: Text(
        //         catalog.name,
        //         textAlign: TextAlign.center,
        //         style: TextStyle(
        //             color: Colors.black,
        //             fontSize: 22,
        //             fontWeight: FontWeight.bold),
        //       ),
        //     )
        //   ],
        // ),
        );
  }
}
