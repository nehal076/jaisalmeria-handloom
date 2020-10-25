
import 'package:flutter/material.dart';

class CatalogProducts extends StatelessWidget {

  final String name;

  CatalogProducts(this.name);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
          children: [
            Padding(
            padding: EdgeInsets.fromLTRB(80, 30, 80, 10),
              child: Text(
                name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ),
        ]
      ),
    );
  }
}
