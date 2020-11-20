import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:jaisalmeria_handloom/pages/catalogs.dart';

class HeaderPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/jhlogo.jpg'),
            ),
            Text('Jaisalmeria Handloom',
                textAlign: TextAlign.center,
                textScaleFactor: 1.2,
                style: Theme.of(context).textTheme.headline5.copyWith(fontWeight: FontWeight.bold)
            ),
            Text('We deliver the product which enhances the look of your room. We make your dream bedroom complete! ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterChip(
                  label: Text('📞 Call'),
                  backgroundColor: Colors.black,
                  labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
                  onSelected: (b){launch("tel://+919414130356");}
                ),
                FilterChip(
                  label: Text('💬 Chat'),
                  backgroundColor: Colors.black,
                  labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
                  onSelected: (b){FlutterOpenWhatsapp.sendSingleMessage("919414130356", "Hello");}
                ),
              ],
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: MaterialButton(
                onPressed: () => {
                  Scrollable.ensureVisible(CatalogsPage.dataKey.currentContext),
                },
                child: Transform.rotate(
                  angle: 1.5,
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}