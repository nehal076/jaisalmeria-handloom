import 'dart:ui';

import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Jaisalmeria Handloom',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),),
          ),
          ListTile(
            title: Text('Home',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
            onTap: () {},
          ),
          ListTile(
            title: Text('About Us',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
            onTap: () {},
          ),
          ListTile(
            title: Text('Catalogs',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}