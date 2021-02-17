import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/cart.dart';
import 'package:provider/provider.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget  {
  @override
  _MyAppBarState createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  void initState() {
    super.initState();
    _IsSearching = false;
    init();
  }

  Widget appBarTitle = 
  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              "assets/images/jh.jpg",
              height: kToolbarHeight - 10,
              width: kToolbarHeight - 10,
            ),
          ),
          // Text('Jaisalmeria Handloom', style: TextStyle(color: Colors.black, fontSize: 12),)
        ],
      );
  Icon actionIcon = Icon(CupertinoIcons.search, color: Colors.black,);
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  List<String> _list;
  bool _IsSearching;
  String _searchText = "";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return AppBar(
      backgroundColor: Colors.white24, // status bar color
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: Colors.black),
      leadingWidth: 40.0,
      // leading: InkWell(
      //   onTap: () {
      //     Scaffold.of(context).openDrawer();
      //   },
      //   child: Padding(
      //     padding: const EdgeInsets.only(left: 16.0),
      //     child: Image.asset("assets/icon-sidebar.png"),
      //   ),
      // ),
      elevation: 0.0,
      title: appBarTitle,
      actions: [
        // IconButton(icon: Icon(CupertinoIcon(CupertinoIcons.search)), onPressed: () {}),
        IconButton(icon: actionIcon, onPressed: () {
            setState(() {
              if (this.actionIcon.icon == CupertinoIcons.search) {
                this.actionIcon = new Icon(Icons.close);
                this.appBarTitle = new TextField(
                  controller: _searchQuery,
                  decoration: new InputDecoration(
                      prefixIcon: new Icon(CupertinoIcons.search),
                      hintText: "Search...",
                  ),
                );
                _handleSearchStart();
              }
              else {
                _handleSearchEnd();
              }
            });
          }),
        IconButton(
            icon: (cart.itemCount != 0)
                ? Badge(
                    badgeContent: Text(cart.itemCount.toString()),
                    child: Icon(CupertinoIcons.shopping_cart))
                : Icon(CupertinoIcons.shopping_cart),
            onPressed: () {
            Navigator.of(context).pushNamed('/cart');
            }),
      ],
    );
  }

  void _handleSearchStart() {
    setState(() {
      _IsSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(CupertinoIcons.search, color: Colors.black,);
      this.appBarTitle =
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.asset(
              "assets/images/jh.jpg",
              height: kToolbarHeight - 10,
              width: kToolbarHeight - 10,
            ),
          ),
          // Text('Jaisalmeria Handloom', style: TextStyle(color: Colors.black, fontSize: 12),)
        ],
      );
      _IsSearching = false;
      _searchQuery.clear();
    });
  }

  void init() {
    _list = List();
    _list.add("Google");
    _list.add("IOS");
    _list.add("Andorid");
    _list.add("Dart");
    _list.add("Flutter");
    _list.add("Python");
    _list.add("React");
    _list.add("Xamarin");
    _list.add("Kotlin");
    _list.add("Java");
    _list.add("RxAndroid");
  }

}

class ChildItem extends StatelessWidget {
  final String name;
  ChildItem(this.name);
  @override
  Widget build(BuildContext context) {
    return new ListTile(title: new Text(this.name));
  }

}
