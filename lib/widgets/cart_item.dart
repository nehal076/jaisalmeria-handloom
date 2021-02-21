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
    return 
    // Dismissible(
    //   key: ValueKey(id),
    //   direction: DismissDirection.endToStart,
    //   background: Container(
    //     color: Colors.red,
    //   ),
    //   onDismissed: (direction) {
    //     Provider.of<Cart>(context, listen: false).removeItem(productId);
    //   },
    //   child: ListTile(
    //     leading:  Image.asset(imageUrl),
    //     title: Text(name),
    //     subtitle: Row(
    //       children: [
    //         (quantity == 1) ? 
    //         IconButton(icon: Icon(Icons.delete), onPressed: () {
    //           cart.removeItem(productId);
    //         }) :
    //         IconButton(icon: Icon(Icons.do_disturb_on_outlined), onPressed: () {
    //           cart.removeSingleItem(productId);
    //         }),
    //         Text('${(quantity)}'),
    //         IconButton(icon: Icon(Icons.add_circle_outline), onPressed: () {
    //           cart.addItem(productId, name, price, imageUrl);
    //         }),
    //       ]
    //     ),
    //     trailing: Text('₹ ${(price * quantity)}'),
    //   ),
    // );
    Container(
      padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              width: (MediaQuery.of(context).size.width) / 3,
              child: Column(
                children: <Widget>[
                  Image.network(imageUrl),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline),
                          onPressed: () {
                            cart.removeSingleItem(productId);
                          },
                        ),
                        Text("$quantity", style: TextStyle(fontSize: 18)),
                        IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: () {
                            cart.addItem(productId, name, price, imageUrl);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: (MediaQuery.of(context).size.width - 37) / 1.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 12.0),
                        width: 150,
                        child: Text(
                          name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.close,
                          size: 26,
                        ),
                        onPressed: () {
                          Provider.of<Cart>(context, listen: false).removeItem(productId);
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("₹ $price",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "Show Details",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
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
