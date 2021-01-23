import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CartItems extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String name;
  final String imageUrl;

  CartItems(this.id, this.productId, this.price, this.quantity, this.name, this.imageUrl);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
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
        subtitle: Row(
          children: [
            (quantity == 1) ? 
            IconButton(icon: Icon(Icons.delete), onPressed: () {
              cart.removeItem(productId);
            }) :
            IconButton(icon: Icon(Icons.do_disturb_on_outlined), onPressed: () {
              cart.removeSingleItem(productId);
            }),
            Text('${(quantity)}'),
            IconButton(icon: Icon(Icons.add_circle_outline), onPressed: () {
              cart.addItem(productId, name, price, imageUrl);
            }),
          ]
        ),
        trailing: Text('₹ ${(price * quantity)}'),
      ),
    );
  }
}
