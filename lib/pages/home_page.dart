import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/pages/catalogs.dart';
import 'package:jaisalmeria_handloom/pages/header.dart';
import 'package:jaisalmeria_handloom/pages/menu.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawer: MenuPage(),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Icon(Icons.search),
            ),
            Icon(Icons.shopping_cart)
          ]
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/background.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                HeaderPage(),
                CatalogsPage(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

