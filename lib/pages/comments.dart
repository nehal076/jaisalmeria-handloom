import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/widgets/app_bar.dart';
import 'package:velocity_x/velocity_x.dart';

class CommentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 30),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                'assets/images/no_user.png'),
              ),
              subtitle: Text(
                  "Greatt material quality and full value for money. I would recommend to go for it without second thought."),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  VxRating(
                  size: 13,
                  selectionColor: Colors.orange,
                  isSelectable: false,
                  onRatingUpdate: (value) {},
                ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "07 Feb 2020",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Divider(
                color: Colors.black26,
                height: 4,
              ),
              height: 24,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                'assets/images/no_user.png'),
              ),
              subtitle: Text(
                  "Material quality is very good. I loved the product."),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  VxRating(
                    size: 13,
                    selectionColor: Colors.orange,
                    isSelectable: false,
                    onRatingUpdate: (value) {},
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "15 Sep 2019",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Divider(
                color: Colors.black26,
                height: 4,
              ),
              height: 24,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                'assets/images/no_user.png'),
              ),
              subtitle: Text(
                  "Quick delivery and excellent quality!"),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  VxRating(
                    size: 13,
                    selectionColor: Colors.orange,
                    isSelectable: false,
                    onRatingUpdate: (value) {},
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "25 Sep 2019",
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}