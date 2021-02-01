import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/pages/address_page.dart';
import 'package:jaisalmeria_handloom/pages/home_page.dart';
import 'package:jaisalmeria_handloom/widgets/cart_item.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 30, color: Theme.of(context).accentColor),
        ),
      ),
      body: cart.itemCount >= 1 ? Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (ctx, i) => CartItems(
                    cart.items.values.toList()[i].id,
                    cart.items.keys.toList()[i],
                    cart.items.values.toList()[i].price,
                    cart.items.values.toList()[i].quantity,
                    cart.items.values.toList()[i].name,
                    cart.items.values.toList()[i].imageUrl)),
          ),
          Card(
            elevation: 15,
            clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
              children: [
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Sub Total',style: TextStyle(color: Colors.black, fontSize: 18),),
                Text('₹ ${(cart.totalAmount)}',style: TextStyle(color: Colors.black, fontSize: 18),
              )]),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Discount',style: TextStyle(color: Colors.black, fontSize: 18),),
                Text('0.0',style: TextStyle(color: Colors.green, fontSize: 18),
              )]),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Taxes and Charges',style: TextStyle(color: Colors.black, fontSize: 18),),
                Text('0.0',style: TextStyle(color: Colors.black, fontSize: 18),
              )]),
              Divider(
                      color: Colors.black,
                      height: 36,
              ),
              Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Text('Grand Total',style: TextStyle(color: Colors.black, fontSize: 20),),
                Text('₹ ${(cart.totalAmount)}',style: TextStyle(color: Colors.black, fontSize: 20),
              )]),
            ]),
          )),
          SizedBox(height: 10),
          ButtonTheme(
            minWidth: MediaQuery.of(context).size.width - 20,
            height: 50.0,
            child: RaisedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddressPage(totalAmount: cart.totalAmount)));
              },
              child: Text(
                'Proceed to checkout',
                style: TextStyle(color: Colors.black, fontSize: 20),
              )),
          ),
          SizedBox(height: 10),
        ],
      ) :
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined),
            Text('YOUR CART IS EMPTY',style: TextStyle(color: Colors.black, fontSize: 20),),
            Text('Please add some products.',style: TextStyle(color: Colors.black, fontSize: 18),),
            RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyHomePage()));
                },
                child: Text(
                  'Explore Products',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}

class CheckoutButton extends StatefulWidget {
  final Cart cart;

  const CheckoutButton({@required this.cart});
  @override
  _CheckoutButtonState createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text('Checkout'),
      onPressed: () async {},
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