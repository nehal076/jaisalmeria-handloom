import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/responses/catalog_model.dart';

import '../pages/catalog_products.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogCard extends StatelessWidget {
  final List<Datum> catalog;
  final int index;

  const CatalogCard({
    Key key,
    this.catalog, this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 

    AspectRatio(
      aspectRatio: 1 / 1,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogProducts(catalog: this.catalog[index])));
        },
        child: Hero(
          tag: catalog[index].id,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:
                    DecorationImage(image: NetworkImage(catalog[index].imageUrl), fit: BoxFit.cover)),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.0),
                  ])),
              child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    catalog[index].name,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )),
            ),
          ),
        ),
      ),
    );
    
    // Container(
    //   width: 140.0,
    //   child: Card(
    //     clipBehavior: Clip.antiAlias,
    //     child: InkWell(
    //       key: key,
    //       onTap: () {
    //         Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogProducts(catalog: catalog)));
    //       },
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: <Widget>[
    //           SizedBox(
    //             height: (MediaQuery.of(context).size.width / 2) - 90,
    //             width: double.infinity,
    //             child: Image(
    //               fit: BoxFit.cover,
    //               image: AssetImage(catalog.imageUrl),
    //             ),
    //           ),
    //           ListTile(
    //               title: Text(catalog.name,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16))
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    
    
    // InkWell(
    //     onTap: () {
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) => CatalogProducts(catalog: catalog),
    //         ),
    //       );
    //     },
    //     child: VxAnimatedBox(
    //             child: Align(
    //                 alignment: Alignment.bottomLeft,
    //                 child: catalog.name.text.white.semiBold
    //                     .make()
    //                     .box
    //                     .withDecoration(BoxDecoration(
    //                         gradient: LinearGradient(
    //                             colors: [Vx.green500, Vx.teal500]),
    //                         borderRadius: BorderRadius.only(
    //                           topRight: Radius.circular(20.0),
    //                         )))
    //                     .p8
    //                     .make()))
    //         .bgImage(DecorationImage(
    //             fit: BoxFit.cover,
    //             image: AssetImage(
    //               catalog.imageUrl,
    //             )))
    //         .rounded
    //         .shadowMd
    //         .make()
    //   );
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

  }
}
