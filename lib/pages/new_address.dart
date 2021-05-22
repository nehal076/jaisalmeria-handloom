import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/pages/payment_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:provider/provider.dart';
import '../models/cart.dart';

class NewAddress extends StatefulWidget {
  @override
  _NewAddressState createState() => _NewAddressState();
}

class _NewAddressState extends State<NewAddress> {
   String dropdownValue = 'Select State';
   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
   final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            TextFormField(decoration: InputDecoration(hintText: 'Full name'),
            validator: (value) {
                  if (value.isEmpty) {
                    return "Name cannot be empty";
                  }
                  return null;
                },
            ),
            TextFormField(
                decoration: InputDecoration(hintText: 'Mobile number'),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Mobile number cannot be empty";
                  }
                  return null;
                },
            ),
            TextFormField(decoration: InputDecoration(hintText: 'PIN code'),
                validator: (value) {
                  if (value.isEmpty) {
                    return "PIN code cannot be empty";
                  }
                  return null;
                },
            ),
            TextFormField(
                decoration: InputDecoration(
                    hintText:
                        'Flat, House no., Building, Company, Apartment'),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Cannot be empty";
                  }
                  return null;
                },
            ),
            TextFormField(
                decoration: InputDecoration(
                    hintText: 'Area, Colony, Street, Sector, Village'),
                validator: (value) {
                  if (value.isEmpty) {
                    return "Cannot be empty";
                  }
                  return null;
                },
            ),
            TextFormField(
                decoration: InputDecoration(hintText: 'Landmark (e.g. near Apollo Hospital)'),
            ),
            TextFormField(decoration: InputDecoration(hintText: 'Town/City'),
                validator: (value) {
                  if (value.isEmpty) {
                    return "City cannot be empty";
                  }
                  return null;
                },
            ),
            DropdownButton<String>(
              itemHeight: 60,
              value: dropdownValue,
              isExpanded: true,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
              items: <String>[
                'Select State',
                'Rajasthan',
                'Gujrat',
                'Delhi'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ]).p16(),
        ),
      ),
      bottomNavigationBar: ButtonTheme(
            minWidth: MediaQuery.of(context).size.width - 20,
            height: 50.0,
            child: RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PaymentScreen(amount: cart.totalAmount.toString())));
                  }
                },
                child: Text(
                  'Add Address',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )),
          ).p16(),
    );
  }
}