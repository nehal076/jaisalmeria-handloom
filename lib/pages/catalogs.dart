import 'package:jaisalmeria_handloom/models/responses/catalog_model.dart';
import 'package:jaisalmeria_handloom/services/api_manager.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/widgets/catalog_card.dart';

class CatalogsPage extends StatefulWidget {

  // Future<Catalog> categories = ApiManager.getAllCategories();

  @override
  _CatalogsPageState createState() => _CatalogsPageState();
}

class _CatalogsPageState extends State<CatalogsPage> {
  Future<Catalog> _categories;

  @override
  void initState() {
    _categories = ApiManager.getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: Text('Shop By Category',
              style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700)),
        ),
        Padding(
          padding: const EdgeInsets.only(
              right: 8.0, top: 8.0, left: 8.0),
          child: RaisedButton(
              color: Theme.of(context).primaryColor,
              child: Text('View All',
                  style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.pushNamed(context, '/categorise');
              }),
        )
      ],
    ),
      20.heightBox,
    Container(
         margin: EdgeInsets.symmetric(vertical: 4.0),
          height: 150.0,
        child: FutureBuilder<Catalog>(
          future: _categories,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    return CatalogCard(catalog: snapshot.data.data, index: index); 
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
      
                  
      // Container(
      //    margin: EdgeInsets.symmetric(vertical: 4.0),
      //     height: 150.0,
      //   child: ListView(
      //     scrollDirection: Axis.horizontal,
      //     children: allCatalogs
      //     .map((catalog) => CatalogCard(catalog: catalog))
      //     .toList(),
      //   ),
      // ),
    ]).p16();
  }
}
