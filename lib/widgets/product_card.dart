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
    return InkWell(
      key: key,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetail(product: product)),
      ),
      child: Hero(
        tag: product.id,
        child: VxAnimatedBox(
                child: Align(
          alignment: Alignment.bottomLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              product.name.text.white.semiBold.make(),
              5.widthBox,
              "₹${product.price}".text.white.bold.make(),
              Spacer(),
              InkWell(
                onTap: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 3),
                    content: Text('Item Added to Cart'),
                  ));
                  cart.addItem(product.id, product.name,
                      double.tryParse(product.price), product.imageUrl);
                },
                child:
                    Icon(CupertinoIcons.cart_badge_plus, color: Colors.white),
              ).px4()
            ],
          )
              .box
              .withDecoration(BoxDecoration(
                  gradient: LinearGradient(colors: [Vx.red500, Vx.orange500]),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0))))
              .p8
              .make(),
        ))
            .bgImage(DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  product.imageUrl,
                )))
            .rounded
            .shadowMd
            .make(),
      ),
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
    );
  }
}

Color getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
}
