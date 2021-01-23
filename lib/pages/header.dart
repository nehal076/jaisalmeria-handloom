import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderPage extends StatelessWidget {
  final ScrollController _scrollController;

  const HeaderPage(this._scrollController);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height -
          Scaffold.of(context).appBarMaxHeight,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Jaisalmeria Handloom',
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.2,
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontWeight: FontWeight.bold))
                    .wHalf(context),
                ClipOval(
                  child: Image.asset(
                    "assets/images/jh.jpg",
                    height: 80.0,
                    width: 80.0,
                  ),
                ),
                20.widthBox,
              ],
            ).p16(),
            Image.asset("assets/images/background.jpg"),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'We deliver the product which enhances the look of your room. We make your dream bedroom complete! ',
                textAlign: TextAlign.center,
                style: context.captionStyle.copyWith(fontSize: 18),
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: MaterialButton(
                onPressed: () {
                  // Scrollable.ensureVisible(CatalogsPage.dataKey.currentContext);
                  _scrollController.animateTo(context.screenHeight,
                      duration: Duration(seconds: 1), curve: Curves.linear);
                },
                child: Icon(Icons.expand_more_rounded),
              ),
            ),
          ]),
    );
  }
}
