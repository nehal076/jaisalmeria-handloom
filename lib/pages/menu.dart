import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22)),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Vx.orange700,
              child: Icon(
                CupertinoIcons.home,
                color: Colors.white,
                size: 18.0,
              ),
            ),
            title: Text('Home',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            onTap: () {},
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Vx.pink700,
              child: Icon(
                CupertinoIcons.person_alt,
                color: Colors.white,
                size: 18.0,
              ),
            ),
            title: Text('About Us',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            onTap: () {},
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Vx.green700,
              child: Icon(
                CupertinoIcons.square_list,
                color: Colors.white,
                size: 18.0,
              ),
            ),
            title: Text('Catalogs',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
