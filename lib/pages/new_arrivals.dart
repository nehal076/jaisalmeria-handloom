import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class NewArrivals extends StatefulWidget {
  @override
  _NewArrivalsState createState() => _NewArrivalsState();
}

class _NewArrivalsState extends State<NewArrivals> {
List<Product> productList = [
  Product(id: "2", name: 'Bedsheet', imageUrl:'assets/product/IMG-20200908-WA0058.jpg', price: '299', images: []),
  Product(id: "102", name: 'Curtain', imageUrl:'assets/catalog/curtain.jpg', price: '391', images: []),
  Product(id: "202", name: 'Cushion', imageUrl:'assets/catalog/cushion.jpg', price: '391', images: []),
  Product(id: "301", name: 'Towel', imageUrl:'assets/catalog/towels.jpg', price: '391',images: []),
  Product(id: "401", name: 'Fridge Cover', imageUrl:'assets/catalog/fridgecover.jpg', price: '391',images: []),
  Product(id: "501", name: 'Comforter', imageUrl:'assets/catalog/comforter.jpg', price: '391', images: []),
];
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Text('New Arrivals',
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w700)),
          ), 
           Container(
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
          ),
        ],
      ).p16();
  }
}