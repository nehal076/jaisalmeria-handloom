class Catalog {
  final int id;
  final String name;
  final String imageUrl;
  final List items;

  Catalog({this.id, this.name, this.imageUrl, this.items});
}

class Product {
  final int id;
  final String name;
  final String imageUrl;
  final String price;

  Product({this.id, this.name, this.imageUrl, this.price});

}


final allCatalogs = <Catalog>[
  Catalog(id: 1, name: 'Bedsheets', imageUrl:'assets/catalog/bedsheet.jpg',
  items: [
    Product(id: 2, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0058.jpg', price: '299'),
    Product(id: 3, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0059.jpg', price: '399'),
    Product(id: 4, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0060.jpg', price: '195'),
    Product(id: 5, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0061.jpg', price: '699'),
    Product(id: 6, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0061.jpg', price: '699'),
    Product(id: 7, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0062.jpg', price: '599'),
    Product(id: 8, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0063.jpg', price: '499'),
    Product(id: 9, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0064.jpg', price: '391'),
    Product(id: 10, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0065.jpg', price: '391'),
    Product(id: 11, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0066.jpg', price: '391'),
    Product(id: 12, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0067.jpg', price: '391'),
    Product(id: 13, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0068.jpg', price: '391'),
    Product(id: 14, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0069.jpg', price: '391'),
    Product(id: 15, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0070.jpg', price: '391'),
    Product(id: 16, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0071.jpg', price: '391'),
    Product(id: 17, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0072.jpg', price: '391'),
    Product(id: 18, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0073.jpg', price: '391'),
    Product(id: 19, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0074.jpg', price: '391'),
    Product(id: 20, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0075.jpg', price: '391'),
    Product(id: 21, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0076.jpg', price: '391'),
    Product(id: 22, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0077.jpg', price: '391'),
    Product(id: 23, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0078.jpg', price: '391'),
    Product(id: 24, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0080.jpg', price: '391'),
  ]),
  Catalog(id: 101, name: 'Curtains', imageUrl:'assets/catalog/curtain.jpg', items:[
    Product(id: 102, name: 'Curtains', imageUrl:'assets/catalog/curtain.jpg', price: '391'),
    Product(id: 103, name: 'Curtains', imageUrl:'assets/catalog/curtain.jpg', price: '391'),
    Product(id: 104, name: 'Curtains', imageUrl:'assets/catalog/curtain.jpg', price: '391'),
    Product(id: 105, name: 'Curtains', imageUrl:'assets/catalog/curtain.jpg', price: '391'),
  ]),
  Catalog(id: 201, name: 'Cushions', imageUrl:'assets/catalog/cushion.jpg', items:[]),
  Catalog(id: 301, name: 'Towels', imageUrl:'assets/catalog/towels.jpg', items:[]),
  Catalog(id: 401, name: 'Fridge Covers', imageUrl:'assets/catalog/fridgecover.jpg', items:[]),
  Catalog(id: 501, name: 'Comforters', imageUrl:'assets/catalog/comforter.jpg', items:[]),
];
