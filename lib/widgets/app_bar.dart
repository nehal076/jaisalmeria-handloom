import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/cart.dart';
import 'package:jaisalmeria_handloom/pages/cart_screen.dart';
import 'package:provider/provider.dart';

class MyAppBar extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black),
      leadingWidth: 40.0,
      // leading: InkWell(
      //   onTap: () {
      //     Scaffold.of(context).openDrawer();
      //   },
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 16.0),
      //     child: Image.asset("assets/icon-sidebar.png"),
      //   ),
      // ),
      elevation: 0.0,
      actions: [
        IconButton(icon: Icon(CupertinoIcons.search), onPressed: () {}),
        IconButton(
            icon: (cart.itemCount != 0)
                ? Badge(
                    badgeContent: Text(cart.itemCount.toString()),
                    child: Icon(CupertinoIcons.shopping_cart))
                : Icon(CupertinoIcons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            }),
      ],
    );
  }
}
