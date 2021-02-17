import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/responses/product_model.dart';
import 'package:jaisalmeria_handloom/services/api_manager.dart';
import 'package:jaisalmeria_handloom/widgets/product_detail.dart';
import 'package:velocity_x/velocity_x.dart';

class BestSelling extends StatefulWidget {
  @override
  _BestSellingState createState() => _BestSellingState();
}

class _BestSellingState extends State<BestSelling> {
// List<Product> productList = [
//   Product(id: "301", name: 'Towel', imageUrl:'assets/catalog/towels.jpg', price: '391',images: []),
//   Product(id: "401", name: 'Fridge Cover', imageUrl:'assets/catalog/fridgecover.jpg', price: '391',images: []),
//   Product(id: "501", name: 'Comforter', imageUrl:'assets/catalog/comforter.jpg', price: '391', images: []),
//   Product(id: "102", name: 'Curtain', imageUrl:'assets/catalog/curtain.jpg', price: '391', images: []),
//   Product(id: "202", name: 'Cushion', imageUrl:'assets/catalog/cushion.jpg', price: '391', images: []),
//   Product(id: "2", name: 'Bedsheet', imageUrl:'assets/product/IMG-20200908-WA0058.jpg', price: '299', images: []),
//   Product(id: "102", name: 'Curtain', imageUrl:'assets/catalog/curtain.jpg', price: '391', images: []),
//   Product(id: "202", name: 'Cushion', imageUrl:'assets/catalog/cushion.jpg', price: '391', images: []),
//   Product(id: "301", name: 'Towel', imageUrl:'assets/catalog/towels.jpg', price: '391',images: []),
//   Product(id: "401", name: 'Fridge Cover', imageUrl:'assets/catalog/fridgecover.jpg', price: '391',images: []),
//   Product(id: "501", name: 'Comforter', imageUrl:'assets/catalog/comforter.jpg', price: '391', images: []),
//   Product(id: "2", name: 'Bedsheet', imageUrl:'assets/product/IMG-20200908-WA0058.jpg', price: '299', images: []),
// ];
  Future<Product> _products;

  @override
  void initState() {
    _products = ApiManager.getBestSelling();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Text('Best Selling',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700)),
          ), 
                    Container(
            margin: EdgeInsets.symmetric(vertical: 8.0),
            height: 300.0,
              child: FutureBuilder<Product>(
                future: _products,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: ScrollPhysics(),
                      itemCount: snapshot.data.data.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 8, left: 6, right: 6, bottom: 12),
                      itemBuilder: (context, index) {
                          return // ProductCard(product: snapshot.data.data, index: index); 
                          Container(
                            width: 140.0,
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetail(product: snapshot.data.data[index])),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      height: 160,
                                      child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(snapshot.data.data[index].imageUrl),
                                          ),
                                        ),
                                      
                                    
                                    ListTile(
                                      title: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 5),
                                        child: Text(snapshot.data.data[index].name,style: TextStyle(fontSize: 14)),
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('₹${snapshot.data.data[index].price}', style: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.w700)),
                                          [
                                            VxRating(
                                              size: 13,
                                              selectionColor: Colors.orange,
                                              isSelectable: false,
                                              value: 10,
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
                        }
                      );
                  } else
                    return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          //  Container(
          //   margin: EdgeInsets.symmetric(vertical: 8.0),
          //   height: 240.0,
          //   child: ListView(
          //     scrollDirection: Axis.horizontal,
          //     children: productList.map((i) {
          //       return Builder(
          //         builder: (BuildContext context) {
          //           return Container(
          //             width: 140.0,
          //             child: Card(
          //               clipBehavior: Clip.antiAlias,
          //               child: InkWell(
          //                 onTap: () {
          //                   Navigator.push(
          //                     context,
          //                     MaterialPageRoute(
          //                         builder: (context) => ProductDetail(product: i)),
          //                   );
          //                 },
          //                 child: Column(
          //                   crossAxisAlignment:CrossAxisAlignment.start,
          //                   children: <Widget>[
          //                     SizedBox(
          //                       height: 160,
          //                       child: Image(
          //                             fit: BoxFit.cover,
          //                             image: AssetImage(i.imageUrl),
          //                           ),
          //                         ),
                                
                              
          //                     ListTile(
          //                       title: Text(i.name,style: TextStyle(fontSize: 14)),
          //                       subtitle: Text('₹${i.price}', style: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.w700)),
          //                     )
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           );
          //         },
          //       );
          //     }).toList(),
          //   ),
          // ),
        ],
      ).p16();
  }
}