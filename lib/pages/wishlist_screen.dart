import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/wishlist.dart';
import 'package:jaisalmeria_handloom/pages/home_page.dart';
import 'package:jaisalmeria_handloom/widgets/app_bar.dart';
import 'package:jaisalmeria_handloom/widgets/wish_item.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Wishlist>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      body: cart.itemCount >= 1 ? Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => WishItems(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].name,
                    cart.items.values.toList()[i].imageUrl)),
          ),
        ],
      ) :
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/empty_wishlist.png')),
            Text('YOUR WISHLIST IS EMPTY',style: TextStyle(color: Colors.black, fontSize: 20),),
            Text('Add products you love.',style: TextStyle(color: Colors.black, fontSize: 18),),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyHomePage()));
                },
                child: Text(
                  'Explore',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
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