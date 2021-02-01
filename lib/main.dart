import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jaisalmeria_handloom/models/cart.dart';
import 'package:jaisalmeria_handloom/models/wishlist.dart';
import 'package:jaisalmeria_handloom/pages/cart_screen.dart';
import 'package:jaisalmeria_handloom/pages/login_page.dart';
import 'package:jaisalmeria_handloom/pages/sign_up.dart';
import 'package:jaisalmeria_handloom/pages/wishlist_screen.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/home_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.white,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        home: MyHomePage(title: 'Jaisalmeria Handloom'),
        routes: {
          '/cart': (ctx) => CartScreen(),
          '/auth': (ctx) => LoginPage(),
          '/signup': (ctx) => SignupPage(),
          '/wishlist': (ctx) => WishlistScreen(),
        },
      ),
    );
  }
}
