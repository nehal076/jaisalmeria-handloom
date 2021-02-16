import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/cart.dart';
import 'package:jaisalmeria_handloom/models/responses/product_details_model.dart';
import 'package:jaisalmeria_handloom/models/wishlist.dart';
import 'package:jaisalmeria_handloom/services/api_manager.dart';
import 'package:jaisalmeria_handloom/widgets/app_bar.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:jaisalmeria_handloom/pages/payment_screen.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductDetail extends StatefulWidget {
  final product;

  ProductDetail({this.product});

  @override
  State<StatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> with SingleTickerProviderStateMixin  {
  Future<ProductDetails> _product;
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 2);
    _product = ApiManager.getProductDetails(widget.product.id);
    print(_product);
    super.initState();
  }

  bool _visible = true;
  TransformationController controller = TransformationController();

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
                    tag: widget.product.id,
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
                          images: [NetworkImage(widget.product.imageUrl)]),
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
                          _buildNameWidget(widget.product),
                          SizedBox(height: 12.0),
                          _buildPriceWidget(widget.product),
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
                          _buildMoreInfoData(widget.product),
                          SizedBox(height: 24.0),
                          _buildComments(context),
                          _buildSimilarProducts(context),
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
      bottomNavigationBar: _buildBottomNavigationBar(context, cart, widget.product, wishlist),
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
          "₹${int.parse(product.price) - (int.parse(product.discount) / 100)}",
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
          "${product.discount}% Off",
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

_buildMoreInfoData(product) {
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


_buildComments(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.0, color: Colors.black12),
          bottom: BorderSide(width: 1.0, color: Colors.black12),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Comments",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                Text(
                  "View All",
                  style: TextStyle(fontSize: 18.0, color: Colors.blue),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            SizedBox(height: 12),
            Row(
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
                  "1250 Comments",
                  style: TextStyle(color: Colors.black54),
                )
              ],
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
      ),
    );
  }


 _buildSimilarProducts(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  "Similar Items",
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    print("Clicked");
                  },
                  child: Text(
                    "View All",
                    style: TextStyle(fontSize: 18.0, color: Colors.blue),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ],
          ),
        ),
        buildTrending()
      ],
    );
  }

  buildTrending() {
    List<ProductDetails> productList = [
      ProductDetails(id: "2", name: 'Bedsheet', imageUrl:'assets/product/IMG-20200908-WA0058.jpg', price: '299'),
      ProductDetails(id: "102", name: 'Curtain', imageUrl:'assets/catalog/curtain.jpg', price: '391'),
      ProductDetails(id: "202", name: 'Cushion', imageUrl:'assets/catalog/cushion.jpg', price: '391'),
      ProductDetails(id: "301", name: 'Towel', imageUrl:'assets/catalog/towels.jpg', price: '391'),
      ProductDetails(id: "401", name: 'Fridge Cover', imageUrl:'assets/catalog/fridgecover.jpg', price: '391'),
      ProductDetails(id: "501", name: 'Comforter', imageUrl:'assets/catalog/comforter.jpg', price: '391'),
    ];
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      height: 260.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: productList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: 140.0,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, '/products',
                          arguments: i);
                    },
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 160,
                          child: Image(
                                fit: BoxFit.cover,
                                image: AssetImage(i.imageUrl),
                              ),
                            ),
                        ListTile(
                          title: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(i.name,style: TextStyle(fontSize: 14)),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('₹${i.price}', style: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.w700)),
                              [
                                VxRating(
                                  size: 13,
                                  selectionColor: Colors.orange,
                                  isSelectable: false,
                                  onRatingUpdate: (value) {},
                                ),
                                5.widthBox,
                                "(100)".text.xs.gray600.make(),
                              ].row()
                            ],
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
