import 'package:flutter/material.dart';
import 'package:jaisalmeria_handloom/models/responses/catalog_model.dart';
import 'package:jaisalmeria_handloom/services/api_manager.dart';
import 'package:jaisalmeria_handloom/widgets/app_bar.dart';
import 'package:jaisalmeria_handloom/widgets/catalog_card.dart';
import 'package:velocity_x/velocity_x.dart';

class AllCategories extends StatefulWidget {
  @override
  _AllCategoriesState createState() => _AllCategoriesState();
}

class _AllCategoriesState extends State<AllCategories> {
  Future<Catalog> _categories;

  @override
  void initState() {
    _categories = ApiManager.getAllCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: FutureBuilder<Catalog>(
          future: _categories,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: context.isMobile ? 2 : 4, 
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 10
                ),
                scrollDirection: Axis.vertical,
                  itemCount: snapshot.data.data.length,
                  itemBuilder: (context, index) {
                    return CatalogCard(catalog: snapshot.data.data, index: index); 
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}