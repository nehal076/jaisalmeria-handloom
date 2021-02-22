import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/widgets/app_bar.dart';
import 'package:jaisalmeria_handloom/widgets/filter.dart';
import 'package:jaisalmeria_handloom/widgets/product_card.dart';

import '../models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:simple_animations/simple_animations.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class CatalogProducts extends StatelessWidget {
  final Catalog catalog;

  CatalogProducts({this.catalog});

  @override
  Widget build(BuildContext context) {
    PanelController filterController = new PanelController();
    return Scaffold(
      appBar: MyAppBar(),
      body: SlidingUpPanel(
        controller: filterController,
        minHeight: 1,
        color: Colors.white,
        panel: Filtre(),
        collapsed: Container(
          decoration:
              BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                  size: 16,
                ),
              ),
              Text(
                "Filter",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        body: ListView(
          children: [
            Column(
              children: <Widget>[
              Hero(
                tag: catalog.id != null ? catalog.id : UniqueKey(),
                child: Material(
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(catalog.imageUrl),
                        fit: BoxFit.cover
                      )
                    ),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomRight,
                          colors: [
                            Colors.black.withOpacity(.8),
                            Colors.black.withOpacity(.1),
                          ]
                        )
                      ),
                      child: Center(child: FadeAnimation(1, Text(catalog.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 40),)))
                    ),
                  ),
                ),
              ),
            ]),
            20.heightBox,
            Container(
              margin: const EdgeInsets.all(8.0),
              width: MediaQuery.of(context).size.width,
              child: Card(
                elevation: 4.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildFilterButton("SORT",filterController),
                      Container(
                        color: Colors.black,
                        width: 2.0,
                        height: 24.0,
                      ),
                      _buildFilterButton("REFINE", filterController),
                    ],
                  ),
                ),
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: context.isMobile ? 2 : 4,
              childAspectRatio: 0.7,
              padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
              children: catalog.items.map((product) {
                return ProductCard(product: product, key: UniqueKey());
              }).toList(),
            ),
          ],
        )
      ),
    );
  }
}

_buildFilterButton(String title,filterController) {
    return InkWell(
      onTap: () {
        filterController.open();
      },
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          SizedBox(
            width: 2.0,
          ),
          Text(title),
        ],
      ),
    );
  }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeAnimation(this.delay, this.child);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(Duration(milliseconds: 500), Tween(begin: 0.0, end: 1.0)),
      Track("translateY").add(
        Duration(milliseconds: 500), Tween(begin: -30.0, end: 0.0),
        curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
          offset: Offset(0, animation["translateY"]), 
          child: child
        ),
      ),
    );
  }
}