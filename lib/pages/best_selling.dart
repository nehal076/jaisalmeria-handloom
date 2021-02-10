import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class BestSelling extends StatefulWidget {
  @override
  _BestSellingState createState() => _BestSellingState();
}

class _BestSellingState extends State<BestSelling> {
List<Product> productList = [
  Product(id: "301", name: 'Towel', imageUrl:'assets/catalog/towels.jpg', price: '391',images: []),
  Product(id: "401", name: 'Fridge Cover', imageUrl:'assets/catalog/fridgecover.jpg', price: '391',images: []),
  Product(id: "501", name: 'Comforter', imageUrl:'assets/catalog/comforter.jpg', price: '391', images: []),
  Product(id: "102", name: 'Curtain', imageUrl:'assets/catalog/curtain.jpg', price: '391', images: []),
  Product(id: "202", name: 'Cushion', imageUrl:'assets/catalog/cushion.jpg', price: '391', images: []),
  Product(id: "2", name: 'Bedsheet', imageUrl:'assets/product/IMG-20200908-WA0058.jpg', price: '299', images: []),
];
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
            height: 240.0,
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
                                title: Text(i.name,style: TextStyle(fontSize: 14)),
                                subtitle: Text('₹${i.price}', style: TextStyle(color: Theme.of(context).accentColor,fontWeight: FontWeight.w700)),
                              )
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