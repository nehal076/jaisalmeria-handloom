import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  final List<String> categories = [
              '1.png',
              '40.png',
              '11.png',
              '33.png',
              '9.png',
              '5.png',
              '43.png',
              '31.png',
              '7.png',
              '35.png',
              '43.png',
              '44.png',
              '28.png',
              '20.png'            ];
  final List<String> categoryTitle = [
              'Bedsheets',
              'Curtains',
              'Cushions',
              'Towels',
              'Covers',
              'Comfortors',
              'Mats',
              'Table Cloth',
              'Sofa Covers',
              'Oven Mitts',
              'Shower Mats',
              'Welcome Mats',
              'Soft Pillows',
              'Floor Mats'
            ];

  CategoriesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 12),
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   PageTransition(
                    //     type: PageTransitionType.fade,
                    //     child: ProductList(),
                    //   ),
                    // );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: 50,
                          height: 50,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index%2 == 0 ? index%3 != 0 ? index%4 == 0 ? Colors.green[100] : Colors.yellow[100] : Colors.pink[50] : Colors.blue[50],
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          child: Container(
                            width: 55,
                            height: 55,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/categories/" + categories[index],
                                ),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            categoryTitle[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Regular',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}