import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/cart.dart';
import 'package:jaisalmeria_handloom/models/catalog.dart';
import 'package:jaisalmeria_handloom/widgets/app_bar.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:jaisalmeria_handloom/pages/PaymentScreen.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  ProductDetail({this.product});

  @override
  State<StatefulWidget> createState() => _ProductDetailState(product);
}

class _ProductDetailState extends State<ProductDetail> {
  final Product product;
  bool _visible = true;
  TransformationController controller = TransformationController();

  _ProductDetailState(this.product);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: MyAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              height: 300,
              width: MediaQuery.of(context).size.width - 20,
              child: Hero(
                tag: product.id,
                child: InteractiveViewer(
                  transformationController: controller,
                  onInteractionStart: (scale) {
                    setState(() => _visible = false);
                  },
                  onInteractionEnd: (scale) {
                    setState(() {
                      controller.value = Matrix4.identity();
                      _visible = true;
                    });
                  },
                  child: Carousel(
                      autoplay: false,
                      boxFit: BoxFit.cover,
                      dotBgColor: Colors.transparent,
                      dotColor: Colors.black.withOpacity(0.5),
                      images: (product.images.isNotEmpty)
                          ? product.images.map((product) {
                              return AssetImage(product.imageUrl);
                            }).toList()
                          : [AssetImage(product.imageUrl)]),
                ),
              ),
            ),
            Visibility(
              visible: _visible,
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        '₹ ${product.price}',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      5.widthBox,
                      Text(
                        '₹ ${product.price}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _visible,
              child: ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  FloatingActionButton.extended(
                    onPressed: () {
                      cart.addItem(product.id, product.name,
                          double.tryParse(product.price), product.imageUrl);
                    },
                    label: "Add to cart".text.semiBold.make(),
                    icon: Icon(CupertinoIcons.cart_fill_badge_plus),
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PaymentScreen(
                                amount: product.price,
                              )));
                    },
                    backgroundColor: Vx.orange500,
                    label: "Buy Now".text.semiBold.make(),
                    icon: Icon(CupertinoIcons.money_dollar_circle_fill),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
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
