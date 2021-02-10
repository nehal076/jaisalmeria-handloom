import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HeaderPage extends StatelessWidget {
  final ScrollController _scrollController;
  final List imgList = [
    'assets/images/background.jpg',
    'assets/images/banner-2.jpg',
    'assets/images/banner-3.jpg',
    'assets/images/banner-4.jpg'
  ];

  HeaderPage(this._scrollController);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     ClipOval(
            //       child: Image.asset(
            //         "assets/images/jh.jpg",
            //         height: 80.0,
            //         width: 80.0,
            //       ),
            //     ),
            //     Text('Jaisalmeria Handloom', textAlign: TextAlign.center,
            //             textScaleFactor: 1.2,
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .headline6
            //                 .copyWith(fontWeight: FontWeight.bold))
                    
                
            //   ],
            // ),
         SizedBox(height: 20),
        //  SizedBox(
        //   height: kIsWeb ? MediaQuery.of(context).size.height / 2 : 260,
        //   width: MediaQuery.of(context).size.width,
        //   child: Carousel(
        //     images: [
        //       Image(
        //         fit: BoxFit.cover,
        //         image: AssetImage("assets/images/background.jpg"),
        //       ),
        //       Image(
        //         fit: BoxFit.cover,
        //         image: AssetImage("assets/images/banner-2.jpg"),
        //       ),
        //       Image(
        //         fit: BoxFit.cover,
        //         image: AssetImage("assets/images/banner-3.jpg"),
        //       ),
        //       Image(
        //         fit: BoxFit.cover,
        //         image: AssetImage("assets/images/banner-4.jpg"),
        //       ),
        //     ],
        //     dotSize: 4.0,
        //     dotSpacing: 15.0,
        //     dotColor: Colors.lightGreenAccent,
        //     indicatorBgPadding: 5.0,
        //     dotBgColor: Colors.transparent,
        //     borderRadius: true,
        //     moveIndicatorFromBottom: 180.0,
        //     noRadiusForIndicator: true,
        //     ),
        //   ),
           CarouselSlider(
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
            ),
            items: imgList.map(
                  (url) {
                return Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: Image(
                          height: 200,
                          image: AssetImage(url),
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            // OutlineButton(
                            //   onPressed: () {
                            //     _scrollController.animateTo(context.screenHeight,
                            //         duration: Duration(seconds: 1), curve: Curves.linear);
                            //   },
                            //   color: Color(0x00000111),
                            //   child: Text('Shop Now', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
                            //   borderSide: BorderSide(color: Colors.black, style: BorderStyle.solid, width: 1),
                            // ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              },
            ).toList(),
          ),
          
            // SizedBox(height: 20),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
            //   child: Text(
            //     'We deliver the product which enhances the look of your room. We make your dream bedroom complete! ',
            //     textAlign: TextAlign.center,
            //     style: context.captionStyle.copyWith(fontSize: 18),
            //   ),
            // ),
            // Align(
            //   alignment: FractionalOffset.bottomCenter,
            //   child: MaterialButton(
            //     onPressed: () {
            //       // Scrollable.ensureVisible(CatalogsPage.dataKey.currentContext);
            //       _scrollController.animateTo(context.screenHeight,
            //           duration: Duration(seconds: 1), curve: Curves.linear);
            //     },
            //     color: Colors.black,
            //     child: Text('Shop Now', style: TextStyle(color: Colors.white),),
            //   ),
            // ),
          ]),
    );
  }
}
