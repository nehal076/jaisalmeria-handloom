import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jaisalmeria_handloom/models/cart.dart';
import 'package:jaisalmeria_handloom/models/responses/login_modal.dart';
import 'package:jaisalmeria_handloom/models/wishlist.dart';
import 'package:jaisalmeria_handloom/pages/cart_screen.dart';
import 'package:jaisalmeria_handloom/pages/login_page.dart';
import 'package:jaisalmeria_handloom/pages/sign_up.dart';
import 'package:jaisalmeria_handloom/pages/user_settings.dart';
import 'package:jaisalmeria_handloom/pages/wishlist_screen.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LoginModal user;

  const MyApp({Key key, this.user}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
         ChangeNotifierProvider.value(
          value: Wishlist(),
        )
      ],
      child: MaterialApp(
        title: 'Jaisalmeria Handloom',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.latoTextTheme()),
        home: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: TabBarView(
            children: [
              MyHomePage(title: "Jaisalmeria Handloom", user: user),
              WishlistScreen(),
              CartScreen(),
              UserSettings()
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(CupertinoIcons.home),
              ),
              Tab(
                icon: new Icon(CupertinoIcons.heart),
              ),
              Tab(
                icon: new Icon(CupertinoIcons.cart),
              ),
              Tab(
                icon: new Icon(CupertinoIcons.profile_circled),
              ),
            ],
            labelColor: Colors.green,
            unselectedLabelColor: Colors.blue[600],
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Colors.green[100],
          ),
          backgroundColor: Colors.white,
        ),
      ),
        routes: {
          '/home': (ctx) => MyApp(),
          '/cart': (ctx) => CartScreen(),
          '/auth': (ctx) => LoginPage(),
          '/signup': (ctx) => SignupPage(),
          '/wishlist': (ctx) => WishlistScreen(),
        },
      ),
    );
  }
}
