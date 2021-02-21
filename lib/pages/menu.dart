import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/main.dart';
import 'package:jaisalmeria_handloom/models/responses/logout_modal.dart';
import 'package:jaisalmeria_handloom/models/responses/login_modal.dart';
import 'package:jaisalmeria_handloom/services/api_manager.dart';

class MenuPage extends StatefulWidget {

  final LoginModal user;

  const MenuPage({Key key, this.user}) : super(key: key);
  @override
  _MenuPage createState() => _MenuPage();
}

class _MenuPage extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // if (auth.isLoggedIn)
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/images/background.jpg'),
          )),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage(
                'assets/images/no_user.png'),
          ),
          accountEmail: Text(widget.user != null? widget.user.data.email: '', style: TextStyle(color: Colors.black),),
          accountName: Text(widget.user != null? widget.user.data.firstName +' '+widget.user.data.lastName : 'Welcome, guest', style: TextStyle(color: Colors.black)),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home, color: Theme.of(context).accentColor),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_basket,
                    color: Theme.of(context).accentColor),
                title: Text('Shop'),
                trailing: Text('New',
                    style: TextStyle(color: Theme.of(context).primaryColor)),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/shop');
                },
              ),
              ListTile(
                leading: Icon(Icons.category, color: Theme.of(context).accentColor),
                title: Text('Categories'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/categorise');
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite, color: Theme.of(context).accentColor),
                title: Text('My Wishlist'),
                trailing: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text('4',
                      style: TextStyle(color: Colors.white, fontSize: 10.0)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/wishlist');
                },
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart,
                color: Theme.of(context).accentColor),
                title: Text('My Cart'),
                trailing: Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Text('2',
                      style: TextStyle(color: Colors.white, fontSize: 10.0)),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart');
                },
              ),
              if(widget.user == null)
              ListTile(
                leading: Icon(Icons.lock, color: Theme.of(context).accentColor),
                title: Text('Login'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/auth');
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.settings, color: Theme.of(context).accentColor),
                title: Text('Settings'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/settings');
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app,
                    color: Theme.of(context).accentColor),
                title: Text('Logout'),
                onTap: () {
                  setState(() {
                    // ApiManager.logoutUser(widget.user.message, widget.user.statusCode);
                    // MyApp(user: null);
                  });
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
