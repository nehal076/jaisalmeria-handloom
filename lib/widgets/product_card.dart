import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/widgets/product_detail.dart';
import 'package:jaisalmeria_handloom/models/cart.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductCard extends StatelessWidget {
  final product;
  final int index;

  const ProductCard({Key key, this.product, this.index}) : super(key: key);

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
                tag: product[index].id,
                child: SizedBox(
                  child: Image(
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                    image: NetworkImage( product[index].imageUrl),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: ListTile(
                  title: Text(product[index].name,
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
                            child: Text("₹${product[index].price}", style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontWeight: FontWeight.w700,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text("₹${product[index].price}", style: TextStyle(
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
                  value: product[index].rating.toDouble() + 5
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
    //     tag: product[index].id,
    //     child: VxAnimatedBox(
    //             child: Align(
    //       alignment: Alignment.bottomLeft,
    //       child: Row(
    //         crossAxisAlignment: CrossAxisAlignment.center,
    //         children: [
    //           product[index].name.text.white.semiBold.make(),
    //           5.widthBox,
    //           "₹${product[index].price}".text.white.bold.make(),
    //           Spacer(),
    //           InkWell(
    //             key: key,
    //             onTap: () {
    //               Scaffold.of(context).showSnackBar(SnackBar(
    //                 duration: Duration(seconds: 3),
    //                 content: Text('Item Added to Cart'),
    //               ));
    //               cart.addItem(product[index].id, product[index].name,
    //                   double.tryParse(product[index].price), product[index].imageUrl);
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
    //               product[index].imageUrl,
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
      //         tag: product[index].id,
      //         child: Container(
      //           decoration: BoxDecoration(
      //             image: DecorationImage(
      //               image: new AssetImage(product[index].imageUrl),
      //               fit: BoxFit.cover,
      //             ),
      //           ),
      //         ),
      //       ),
      //       footer: GridTileBar(
      //         title: Text(product[index].name, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
      //           trailing: IconButton(
      //           icon: Icon(Icons.shopping_cart, color: Colors.black,),
      //           onPressed: () {
      //             Scaffold.of(context).showSnackBar(SnackBar(
      //               duration: Duration(seconds: 3),
      //               content: Text('Item Added to Cart'),
      //             ));
      //             cart.addItem(product[index].id, product[index].name, double.tryParse(product[index].price), product[index].imageUrl);
      //           }),
      //           backgroundColor: Colors.grey
      //       ),
      //     ),
      //   ),
      // ),
  }
}
