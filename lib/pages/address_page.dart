import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/cart.dart';
import 'package:jaisalmeria_handloom/pages/new_address.dart';
import 'package:jaisalmeria_handloom/pages/payment_screen.dart';
import 'package:provider/provider.dart';

class AddressPage extends StatefulWidget {
  AddressPage({double totalAmount});

  @override
  State<StatefulWidget> createState() => _AddressPageState();
}

class Addresses {
  final String type;
  final String address;

  Addresses({this.type, this.address});

}

class _AddressPageState extends State<AddressPage> {
  String dropdownValue = 'Select State';
  int selectedIndex = 0;
  final addresses = [
    Addresses(type:"HOME ADDRESS", address:"370/A-1, 3rd C Rd, Sardarpura, Jodhpur"),
    Addresses(type:"OFFICE ADDRESS", address:"GoHive, Gurugram"),
  ];

  @override
  Widget build(BuildContext context) {
  final cart = Provider.of<Cart>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: 
        Center(
        child: Container(
          padding:
              EdgeInsets.only(top: 12.0, left: 12.0, right: 12.0, bottom: 12.0),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Card(
            elevation: 6.0,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Delivery Adress"),
                    Container(
                      height: 200.0,
                      child: ListView.builder(
                        itemCount: addresses.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 12.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                                color: selectedIndex == index ? Color(0xFFE7F9F5) : Colors.white,
                                border: Border.all(
                                  color: selectedIndex == index ? Color(0xFF4CD7A5) : Colors.blueGrey,
                                ),
                              ),
                              child: ListTile(
                                trailing: Icon(
                                   selectedIndex == index ? Icons.check_circle : CupertinoIcons.circle,
                                  color: selectedIndex == index ? Color(0xFF10CA88) : Colors.blueGrey,
                                ),
                                title: Text(addresses[index].type),
                                subtitle: Text(addresses[index].address),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NewAddress()));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 12.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          border: Border.all(
                            color: Colors.blueGrey,
                          ),
                        ),
                        child: ListTile(
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                          ),
                          title: Text('Add a New Address'),
                        ),
                      ),
                    ),
                    Text("Payment method"),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Color(0xFFE7F9F5),
                        border: Border.all(
                          color: Color(0xFF4CD7A5),
                        ),
                      ),
                      child: ListTile(
                        trailing: Icon(
                          Icons.check_circle,
                          color: Color(0xFF10CA88),
                        ),
                        leading: Icon(
                          Icons.account_balance_wallet,
                          color: Color(0xFF10CA88),
                        ),
                        title: Text('PayTm'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 24.0),
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        color: Color(0xFFF93963),
                        onPressed: () => {
                          Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PaymentScreen(amount: cart.totalAmount.toString())))
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: 10.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  "Proceed to Payment",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
