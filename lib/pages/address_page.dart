import 'package:flutter/material.dart';
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
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Expanded(
                child: Column(children: [
                  TextField(decoration: InputDecoration(hintText: 'Full name')),
                  TextField(
                      decoration: InputDecoration(hintText: 'Mobile number')),
                  TextField(decoration: InputDecoration(hintText: 'PIN code')),
                  TextField(
                      decoration: InputDecoration(
                          hintText:
                              'Flat, House no., Building, Company, Apartment')),
                  TextField(
                      decoration: InputDecoration(
                          hintText: 'Area, Colony, Street, Sector, Village')),
                  TextField(
                      decoration: InputDecoration(
                          hintText: 'Landmark (e.g. near Apollo Hospital)')),
                  TextField(decoration: InputDecoration(hintText: 'Town/City')),
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
                ]),
              ),
              ButtonTheme(
                minWidth: MediaQuery.of(context).size.width - 20,
                height: 50.0,
                child: RaisedButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PaymentScreen(amount: '100')));
                    },
                    child: Text(
                      'Add Address',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
              ),
            ],
          ),
        ));
  }
}
