import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HeaderPage extends StatelessWidget {
  final ScrollController _scrollController;

  const HeaderPage(this._scrollController);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - Scaffold.of(context).appBarMaxHeight,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/images/jh.jpg",
                    height: 80.0,
                    width: 80.0,
                  ),
                ),
                Text('Jaisalmeria Handloom', textAlign: TextAlign.center,
                        textScaleFactor: 1.2,
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(fontWeight: FontWeight.bold))
                    
                
              ],
            ),
         SizedBox(
          height: kIsWeb ? MediaQuery.of(context).size.height / 2 : 260,
          width: MediaQuery.of(context).size.width,
          child: Carousel(
            images: [
              Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/background.jpg"),
              ),
              Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/banner-2.jpg"),
              ),
              Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/banner-3.jpg"),
              ),
              Image(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/banner-4.jpg"),
              ),
            ],
            dotSize: 4.0,
            dotSpacing: 15.0,
            dotColor: Colors.lightGreenAccent,
            indicatorBgPadding: 5.0,
            dotBgColor: Colors.transparent,
            borderRadius: true,
            moveIndicatorFromBottom: 180.0,
            noRadiusForIndicator: true,
            ),
          ),
          // SizedBox(
          //   child: Carousel(
          //   autoplay: false,
          //   boxFit: BoxFit.cover,
          //   dotBgColor: Colors.transparent,
          //   dotColor: Colors.black.withOpacity(0.5),
          //   images: [
          //       Image.asset("assets/images/background.jpg"),
          //       Image.asset("assets/images/banner-2.jpg"),
          //     ]
          // )),
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
                color: Colors.black,
                child: Text('Shop Now', style: TextStyle(color: Colors.white),),
              ),
            ),
          ]),
    );
  }
}
