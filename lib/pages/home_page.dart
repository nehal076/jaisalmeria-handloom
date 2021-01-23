import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:jaisalmeria_handloom/pages/catalogs.dart';
import 'package:jaisalmeria_handloom/pages/header.dart';
import 'package:jaisalmeria_handloom/pages/menu.dart';
import 'package:jaisalmeria_handloom/widgets/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.white,
      drawer: MenuPage(),
      appBar: MyAppBar(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            tooltip: "Call",
            onPressed: () => launch("tel://+919414130356"),
            backgroundColor: Colors.black,
            child: Icon(CupertinoIcons.phone),
          ),
          10.widthBox,
          FloatingActionButton(
            tooltip: "Chat",
            onPressed: () =>
                FlutterOpenWhatsapp.sendSingleMessage("919414130356", "Hello"),
            backgroundColor: Colors.black,
            child: Icon(CupertinoIcons.chat_bubble),
          )
        ],
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          HeaderPage(_scrollController),
          CatalogsPage(),
        ],
      ),
    );
  }
}
