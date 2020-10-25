import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/catalogs.dart';
import 'package:jaisalmeria_handloom/header.dart';
import 'package:jaisalmeria_handloom/menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jaisalmeria Handloom',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Jaisalmeria Handloom'),
    );
  }
}

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
            title: Text(widget.title),
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

