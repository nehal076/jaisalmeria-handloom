import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/responses/login_modal.dart';
import 'package:jaisalmeria_handloom/pages/best_selling.dart';
import 'package:jaisalmeria_handloom/pages/catalogs.dart';
import 'package:jaisalmeria_handloom/pages/header.dart';
import 'package:jaisalmeria_handloom/pages/menu.dart';
import 'package:jaisalmeria_handloom/pages/new_arrivals.dart';
import 'package:jaisalmeria_handloom/widgets/app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

import 'categories_view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.user}) : super(key: key);

  final String title;
  final LoginModal user;

  @override
  _MyHomePageState createState() => _MyHomePageState();

  
  static _MyHomePageState of(BuildContext context) =>
    context.findAncestorStateOfType<_MyHomePageState>();
}

class _MyHomePageState extends State<MyHomePage> {
  final _scrollController = ScrollController();
  String string = "Not set yet"; 
  WidgetBuilder leadDialog = (BuildContext context) => Dialog();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: MenuPage(user: widget.user),
      ),
      appBar: MyAppBar(callback: (val) => {
        setState(() {
            string = val;
            print('inside home_page '+string);
          })
        }
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: UniqueKey(),
            tooltip: "Call",
            onPressed: () {},// launch("tel://+919414130356"),
            backgroundColor: Colors.black,
            child: Icon(CupertinoIcons.phone),
          ),
          10.heightBox,
          FloatingActionButton(
            heroTag: UniqueKey(),
            tooltip: "Chat",
            onPressed: () {},
                // FlutterOpenWhatsapp.sendSingleMessage("919414130356", "Hello"),
            backgroundColor: Colors.black,
            child: Icon(CupertinoIcons.chat_bubble),
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        controller: _scrollController,
        children: [
          CategoriesView(),
          HeaderPage(_scrollController),
          SizedBox(height: 20),
          CatalogsPage(),
          NewArrivals(),
          BestSelling(),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Image(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/images/banner-5.jpg')),
          )     
        ],
      ),
    );
  }
}



