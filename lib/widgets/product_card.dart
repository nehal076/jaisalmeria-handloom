import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/catalog.dart';
import 'package:jaisalmeria_handloom/widgets/product_detail.dart';
import 'package:jaisalmeria_handloom/models/cart.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Container(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
             Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductDetail(product: product)),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Hero(
                tag: product.id,
                child: SizedBox(
                  child: Image(
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                    image: AssetImage( product.imageUrl),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: ListTile(
                  title: Text(product.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text("₹${product.price}", style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text("₹${product.price}", style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              [
                VxRating(
                  size: 13,
                  selectionColor: Colors.orange,
                  isSelectable: false,
                  onRatingUpdate: (value) {},
                ),
                5.widthBox,
                "(100)".text.xs.gray600.make(),
              ].row().pLTRB(16, 8, 0, 0)
            ],
          ),
        ),
      ),
    ); 

    
    
    // InkWell(
    //   key: key,
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //       builder: (context) => ProductDetail(product: product)),
      // ),
    //   child: Hero(
    //     tag: product.id,
    //     child: VxAnimatedBox(
    //             child: Align(
    //       alignment: Alignment.bottomLeft,
    //       child: Row(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           product.name.text.white.semiBold.make(),
    //           5.widthBox,
    //           "₹${product.price}".text.white.bold.make(),
    //           Spacer(),
    //           InkWell(
    //             key: key,
    //             onTap: () {
    //               Scaffold.of(context).showSnackBar(SnackBar(
    //                 duration: Duration(seconds: 3),
    //                 content: Text('Item Added to Cart'),
    //               ));
    //               cart.addItem(product.id, product.name,
    //                   double.tryParse(product.price), product.imageUrl);
    //             },
    //             child:
    //                 Icon(CupertinoIcons.cart_badge_plus, color: Colors.white),
    //           ).px4()
    //         ],
    //       )
    //           .box
    //           .withDecoration(BoxDecoration(
    //               // gradient: LinearGradient(colors: [Vx.gray100, Vx.orange500]),
    //               borderRadius: BorderRadius.only(
    //                   bottomLeft: Radius.circular(15.0),
    //                   bottomRight: Radius.circular(15.0))))
    //           .p8
    //           .make(),
    //     ))
    //         .bgImage(DecorationImage(
    //             fit: BoxFit.cover,
    //             image: AssetImage(
    //               product.imageUrl,
    //             )))
    //         .rounded
    //         .shadowMd
    //         .make(),
    //   ),





      // child: Container(
      //   height: 1900,
      //   child: Card(
      //     elevation: 15,
      //     clipBehavior: Clip.antiAliasWithSaveLayer,
      //     child: GridTile(
      //       child: Hero(
      //         tag: product.id,
      //         child: Container(
      //           decoration: BoxDecoration(
      //             image: DecorationImage(
      //               image: new AssetImage(product.imageUrl),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //       ),
      //       footer: GridTileBar(
      //         title: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
      //           trailing: IconButton(
      //           icon: Icon(Icons.shopping_cart, color: Colors.black,),
      //           onPressed: () {
      //             Scaffold.of(context).showSnackBar(SnackBar(
      //               duration: Duration(seconds: 3),
      //               content: Text('Item Added to Cart'),
      //             ));
      //             cart.addItem(product.id, product.name, double.tryParse(product.price), product.imageUrl);
      //           }),
      //           backgroundColor: Colors.grey
      //       ),
      //     ),
      //   ),
      // ),
  }
}
