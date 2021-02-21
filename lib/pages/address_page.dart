import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/pages/new_address.dart';
import 'package:jaisalmeria_handloom/pages/payment_screen.dart';

class AddressPage extends StatefulWidget {
  AddressPage({double totalAmount});

  @override
  State<StatefulWidget> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String dropdownValue = 'Select State';

  @override
  Widget build(BuildContext context) {
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
                        title: Text('HOME ADDRESS'),
                        subtitle: Text("370/A-1, 3rd C Rd, Sardarpura, Jodhpur"),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 12.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        border: Border.all(
                          color: Colors.blueGrey,
                        ),
                      ),
                      child: ListTile(
                        trailing: Icon(
                          CupertinoIcons.circle,
                          color: Colors.blueGrey,
                        ),
                        title: Text('OFFICE ADDRESS'),
                        subtitle: Text("GoHive, Gurugram"),
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
                          builder: (context) => PaymentScreen(amount: '100')))
                          // showDialog(
                          //   context: context,
                          //   // ignore: deprecated_member_use
                          //   child: AlertDialog(
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius:
                          //             BorderRadius.all(Radius.circular(16.0))),
                          //     content: Container(
                          //       height:
                          //           MediaQuery.of(context).size.height / 1.8,
                          //       child: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: <Widget>[
                          //           Icon(
                          //             Icons.check_circle_outline,
                          //             size: 96,
                          //             color: Color(0xFF10CA88),
                          //           ),
                          //           Padding(
                          //             padding: const EdgeInsets.symmetric(
                          //                 vertical: 16.0),
                          //             child: Text(
                          //               "Your order successfull",
                          //               style: TextStyle(fontSize: 20),
                          //             ),
                          //           ),
                          //           Padding(
                          //             padding: const EdgeInsets.symmetric(
                          //                 vertical: 16.0),
                          //             child: Text(
                          //               "Your can track the delivery in the Orders section ",
                          //               style: TextStyle(fontSize: 16),
                          //             ),
                          //           ),
                          //           FlatButton(
                          //             shape: RoundedRectangleBorder(
                          //               borderRadius:
                          //                   BorderRadius.circular(4.0),
                          //             ),
                          //             color: Color(0xFFF93963),
                          //             onPressed: () => {},
                          //             child: Container(
                          //               padding: EdgeInsets.symmetric(
                          //                 vertical: 15.0,
                          //                 horizontal: 10.0,
                          //               ),
                          //               child: Row(
                          //                 mainAxisAlignment:
                          //                     MainAxisAlignment.center,
                          //                 children: <Widget>[
                          //                   Expanded(
                          //                     child: InkWell(
                          //                       onTap: () {
                                                  
                          //                       },
                          //                       child: Text(
                          //                         "Continue Shopping",
                          //                         textAlign: TextAlign.center,
                          //                         style: TextStyle(
                          //                             color: Colors.white,
                          //                             fontWeight:
                          //                                 FontWeight.bold),
                          //                       ),
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //           FlatButton(
                          //             child: Text("Go to orders"),
                          //             onPressed: () {},
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
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
        
        // Padding(
        //   padding: const EdgeInsets.all(18.0),
        //   child: Column(
        //     children: [
        //       Expanded(
        //         child: Column(children: [
        //           TextField(decoration: InputDecoration(hintText: 'Full name')),
        //           TextField(
        //               decoration: InputDecoration(hintText: 'Mobile number')),
        //           TextField(decoration: InputDecoration(hintText: 'PIN code')),
        //           TextField(
        //               decoration: InputDecoration(
        //                   hintText:
        //                       'Flat, House no., Building, Company, Apartment')),
        //           TextField(
        //               decoration: InputDecoration(
        //                   hintText: 'Area, Colony, Street, Sector, Village')),
        //           TextField(
        //               decoration: InputDecoration(
        //                   hintText: 'Landmark (e.g. near Apollo Hospital)')),
        //           TextField(decoration: InputDecoration(hintText: 'Town/City')),
        //           DropdownButton<String>(
        //             itemHeight: 60,
        //             value: dropdownValue,
        //             isExpanded: true,
        //             onChanged: (String newValue) {
        //               setState(() {
        //                 dropdownValue = newValue;
        //               });
        //             },
        //             items: <String>[
        //               'Select State',
        //               'Rajasthan',
        //               'Gujrat',
        //               'Delhi'
        //             ].map((String value) {
        //               return DropdownMenuItem<String>(
        //                 value: value,
        //                 child: Text(value),
        //               );
        //             }).toList(),
        //           ),
        //         ]),
        //       ),
        //       ButtonTheme(
        //         minWidth: MediaQuery.of(context).size.width - 20,
        //         height: 50.0,
        //         child: RaisedButton(
                    // onPressed: () {
                    //   Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (context) => PaymentScreen(amount: '100')));
                    // },
        //             child: Text(
        //               'Add Address',
        //               style: TextStyle(color: Colors.black, fontSize: 20),
        //             )),
        //       ),
        //     ],
        //   ),
        // )
        
        );
  }
}
