import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/cart.dart';
import 'package:jaisalmeria_handloom/models/catalog.dart';
import 'package:jaisalmeria_handloom/models/wishlist.dart';
import 'package:jaisalmeria_handloom/widgets/app_bar.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:jaisalmeria_handloom/pages/payment_screen.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  ProductDetail({this.product});

  @override
  State<StatefulWidget> createState() => _ProductDetailState(product);
}

class _ProductDetailState extends State<ProductDetail> with SingleTickerProviderStateMixin  {

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }


  final Product product;
  bool _visible = true;
  TransformationController controller = TransformationController();

  _ProductDetailState(this.product);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    final cart = Provider.of<Cart>(context);
    final wishlist = Provider.of<Wishlist>(context);
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Card(
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width - 20,
                  child: Hero(
                    tag: product.id,
                    child: InteractiveViewer(
                      transformationController: controller,
                      onInteractionStart: (scale) {
                        setState(() => _visible = false);
                      },
                      onInteractionEnd: (scale) {
                        setState(() {
                          controller.value = Matrix4.identity();
                          _visible = true;
                        });
                      },
                      child: Carousel(
                          autoplay: false,
                          boxFit: BoxFit.cover,
                          dotBgColor: Colors.transparent,
                          dotColor: Colors.black.withOpacity(0.5),
                          images: (product.images.isNotEmpty)
                              ? product.images.map((product) {
                                  return AssetImage(product.imageUrl);
                                }).toList()
                              : [AssetImage(product.imageUrl)]),
                    ),
                  ),
                ),
                Visibility(
                  visible: _visible,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 20,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildNameWidget(product),
                          SizedBox(height: 12.0),
                          _buildPriceWidget(product),
                          SizedBox(height: 12.0),
                          _buildDivider(screenSize),
                          SizedBox(height: 12.0),
                          _buildFurtherInfoWidget(),
                          SizedBox(height: 12.0),
                          _buildDivider(screenSize),
                          SizedBox(height: 12.0),
                          _buildSizeChartWidgets(),
                          SizedBox(height: 12.0),
                          _buildDetailsAndMaterialWidgets(_tabController),
                          SizedBox(height: 20.0),
                          _buildMoreInfoHeader(),
                          SizedBox(height: 6.0),
                          _buildDivider(screenSize),
                          SizedBox(height: 4.0),
                          _buildMoreInfoData(product),
                          SizedBox(height: 24.0),
                        ],
                      )
                    ),
                  ),
                ),
                // Visibility(
                //   visible: _visible,
                //   child: ButtonBar(
                //     alignment: MainAxisAlignment.start,
                //     children: [
                //       FloatingActionButton.extended(
                //         heroTag: UniqueKey(),
                //         onPressed: () {
                //           cart.addItem(product.id, product.name,
                //               double.tryParse(product.price), product.imageUrl);
                //         },
                //         label: "Add to cart".text.semiBold.make(),
                //         icon: Icon(CupertinoIcons.cart_fill_badge_plus),
                //       ),
                //       FloatingActionButton.extended(
                //         heroTag: UniqueKey(),
                //         onPressed: () {
                //           Navigator.of(context).push(MaterialPageRoute(
                //               builder: (context) => PaymentScreen(
                //                     amount: product.price,
                //                   )));
                //         },
                //         backgroundColor: Vx.orange500,
                //         label: "Buy Now".text.semiBold.make(),
                //         icon: Icon(CupertinoIcons.money_dollar_circle_fill),
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, cart, product, wishlist),
    );
  }
  _buildBottomNavigationBar(context, cart, product, wishlist) {

    bool wishList = wishlist.checkIfAdded(product.id, product.name, double.tryParse(product.price), product.imageUrl);
    bool addedTocart = cart.checkIfAdded(product.id, product.name, double.tryParse(product.price), product.imageUrl);
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: RaisedButton(
              onPressed: () {
                setState(() { 
                  wishList = wishlist.addItem(product.id, product.name, double.tryParse(product.price), product.imageUrl);
                });
              },
              color: Colors.grey,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      wishList ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                      color: wishList ? Colors.red : Colors.white,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      wishList ? "ADDED TO WISHLIST" : "ADD TO WISHLIST",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: RaisedButton(
              onPressed: () {
                setState(() { 
                  cart.addItem(product.id, product.name, double.tryParse(product.price), product.imageUrl);
                });
              },
              color: Colors.greenAccent,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      addedTocart ? CupertinoIcons.check_mark : CupertinoIcons.cart_fill_badge_plus,
                      color: Colors.white,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      addedTocart ? "ADDED TO CART" : "ADD TO CART",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

_buildNameWidget(product) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Center(
      child: Text(
        product.name,
        style: TextStyle(fontSize: 18.0, color: Colors.black),
      ),
    ),
  );
}

_buildPriceWidget(product) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Text(
          "₹${product.price}",
          style: TextStyle(fontSize: 18.0, color: Colors.black),
        ),
        SizedBox(width: 8.0),
        Text(
          "₹${product.price}",
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.grey,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        Text(
          "${product.price}% Off",
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.blue[700],
          ),
        ),
      ],
    ),
  );
}

_buildDivider(Size screenSize) {
  return Column(
    children: <Widget>[
      Container(
        color: Colors.grey[600],
        width: screenSize.width,
        height: 0.25,
      ),
    ],
  );
}

_buildFurtherInfoWidget() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Row(
      children: <Widget>[
        Icon(
          Icons.local_offer,
          color: Colors.grey[500],
        ),
        SizedBox(
          width: 12.0,
        ),
        Text(
          "Tap to get further info",
          style: TextStyle(
            color: Colors.grey[500],
          ),
        ),
      ],
    ),
  );
}

_buildSizeChartWidgets() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12.0),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.straighten,
              color: Colors.grey[600],
            ),
            SizedBox(
              width: 12.0,
            ),
            Text(
              "Size",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        Text(
          "SIZE CHART",
          style: TextStyle(
            color: Colors.blue[400],
            fontSize: 12.0,
          ),
        ),
      ],
    ),
  );
}

_buildDetailsAndMaterialWidgets(TabController tabController) {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TabBar(
          controller: tabController,
          tabs: <Widget>[
            Tab(
              child: Text(
                "DETAILS",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Tab(
              child: Text(
                "MATERIAL & CARE",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
          height: 60.0,
          child: TabBarView(
            controller: tabController,
            children: <Widget>[
              Text(
                "76% acrylic, 19% polyster, 5% metallic yarn Hand-wash cold",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              Text(
                "86% acrylic, 9% polyster, 1% metallic yarn Hand-wash cold",
                style: TextStyle(
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ],
    ),
  );
}

_buildMoreInfoHeader() {
  return Padding(
    padding: const EdgeInsets.only(
      left: 12.0,
    ),
    child: Text(
      "MORE INFO",
      style: TextStyle(
        color: Colors.grey[800],
      ),
    ),
  );
}

_buildMoreInfoData(Product product) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 12.0,
    ),
    child: Text(
      "Product Code: ${product.id}\nTax info: Applicable GST will be charged at the time of checkout",
      style: TextStyle(
        color: Colors.grey[600],
      ),
    ),
  );
}
