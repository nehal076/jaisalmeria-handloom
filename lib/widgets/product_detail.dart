import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/catalog.dart';
import 'package:carousel_pro/carousel_pro.dart';

class ProductDetail extends StatelessWidget {

  final Product product;

  ProductDetail({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name)
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 20
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              width: MediaQuery.of(context).size.width -20,
              child: Hero(
                  tag: product.id,
                  child: Carousel(
                      autoplay: false,
                      boxFit: BoxFit.fitWidth,
                      dotBgColor: Colors.transparent,
                      dotColor: Colors.grey[800].withOpacity(0.5),
                      images: [
                      AssetImage(product.imageUrl),
                      AssetImage(product.imageUrl),
                      AssetImage(product.imageUrl),
                    ],
                  ),
              ),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width -20,
                child: Text(
                  '₹ ${product.price}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width -20,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xff64B6FF)),
                ),
                child: Text("Buy Now", style: TextStyle(fontSize: 18)),
              )
            ),
          ],
        ),
      ),
    );

  }
}