import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/cart.dart';
import 'package:jaisalmeria_handloom/pages/cart_screen.dart';
import 'package:provider/provider.dart';

class MyAppBar extends PreferredSize{

  @override
  Size get preferredSize => Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return AppBar(
      actions: [
        IconButton(icon: Icon(Icons.search), onPressed: () {}),
        IconButton(icon: 
        (cart.itemCount != 0) ? Badge(
          badgeContent: Text(cart.itemCount.toString()),
          child: Icon(Icons.shopping_cart)
        ) : Icon(Icons.shopping_cart), onPressed: () {
          Navigator.of(context).pushNamed(CartScreen.routeName);
        }),
      ],
    );
  }
}