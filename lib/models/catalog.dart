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
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0058.jpg', price: '299'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0059.jpg', price: '399'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0060.jpg', price: '195'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0061.jpg', price: '699'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0061.jpg', price: '699'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0062.jpg', price: '599'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0063.jpg', price: '499'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0064.jpg', price: '391'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0065.jpg', price: '391'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0066.jpg', price: '391'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0067.jpg', price: '391'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0068.jpg', price: '391'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0069.jpg', price: '391'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0070.jpg', price: '391'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0071.jpg', price: '391'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0072.jpg', price: '391'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0073.jpg', price: '391'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0074.jpg', price: '391'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0075.jpg', price: '391'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0076.jpg', price: '391'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0077.jpg', price: '391'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0078.jpg', price: '391'),
    Product(id: 1, name: 'Bedsheets', imageUrl:'assets/product/IMG-20200908-WA0080.jpg', price: '391'),
  ]),
  Catalog(id: 2, name: 'Curtains', imageUrl:'assets/catalog/curtain.jpg', items:[
    Product(id: 2, name: 'Curtains', imageUrl:'assets/catalog/curtain.jpg'),
    Product(id: 2, name: 'Curtains', imageUrl:'assets/catalog/curtain.jpg'),
    Product(id: 2, name: 'Curtains', imageUrl:'assets/catalog/curtain.jpg'),
    Product(id: 2, name: 'Curtains', imageUrl:'assets/catalog/curtain.jpg'),
  ]),
  Catalog(id: 3, name: 'Cushions', imageUrl:'assets/catalog/cushion.jpg', items:[]),
  Catalog(id: 4, name: 'Towels', imageUrl:'assets/catalog/towels.jpg', items:[]),
  Catalog(id: 5, name: 'Fridge Covers', imageUrl:'assets/catalog/fridgecover.jpg', items:[]),
  Catalog(id: 6, name: 'Comforters', imageUrl:'assets/catalog/comforter.jpg', items:[]),
];
