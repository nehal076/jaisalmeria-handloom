import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/catalog.dart';
import 'package:jaisalmeria_handloom/widgets/product_detail.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    Key key,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      onTap: () => Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => ProductDetail(product: product)
        ),
      ),
      child: SizedBox(
        height: double.infinity,
        child: Card(
          elevation: 15,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: GridTile(
            child: Hero(
              tag: product.id,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: new AssetImage(product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold)),
                title: Text('₹ ${product.price}', style: TextStyle(color: Colors.green, fontWeight: FontWeight.w800)),
                subtitle: Text('₹ ${product.price}',
                  style: TextStyle(color: Colors.black54,
                  fontWeight: FontWeight.w800,
                  decoration: TextDecoration.lineThrough)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}