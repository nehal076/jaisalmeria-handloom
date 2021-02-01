import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/wishlist.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class WishItems extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final String name;
  final String imageUrl;

  WishItems(this.id, this.productId, this.price, this.name, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Wishlist>(context);
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
      ),
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: ListTile(
        leading:  Image.asset(imageUrl),
        title: Text(name),
        trailing: Text('₹ ${(price)}'),
      ),
    );
  }
}
