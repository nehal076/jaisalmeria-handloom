import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/catalog.dart';
import 'package:carousel_pro/carousel_pro.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.name),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Icon(Icons.search),
                  ),
                  Icon(Icons.shopping_cart),
                ],
              )
            ]
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
                height: 20
            ),
            SizedBox(
              height: 300,
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 20,
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
                    images:
                    (product.images.isNotEmpty) ?
                      product.images.map((product) {
                      return AssetImage(product.imageUrl);
                      }).toList() : [AssetImage(product.imageUrl)]
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _visible,
              child: SizedBox(
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 20,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        '₹ ${product.price}',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '₹ ${product.price}',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: _visible,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                getColorFromHex('#d1d1d1')),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.add_shopping_cart),
                              Text("Add to Cart", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        )
                    ),
                    SizedBox(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                getColorFromHex('#56a8e2')),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.shopping_bag),
                              Text("Buy Now", style: TextStyle(fontSize: 18)),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
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
