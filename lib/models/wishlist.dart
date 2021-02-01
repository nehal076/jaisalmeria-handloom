import 'package:flutter/foundation.dart';

class WishItem {
  final String id;
  final String name;
  final double price;
  final String imageUrl;

  WishItem(
      {@required this.id,
      @required this.name,
      @required this.price,
      @required this.imageUrl
      });

}

class Wishlist with ChangeNotifier {
  Map<String, WishItem> _items = {};

  Map<String, WishItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  bool addItem(String pdtid, String name, double price, String imageUrl) {
    if (_items.containsKey(pdtid)) {
      notifyListeners();
     return true;
    } else {
      _items.putIfAbsent(
          pdtid,
          () => WishItem(
                name: name,
                id: DateTime.now().toString(),
                price: price,
                imageUrl: imageUrl
              ));
      notifyListeners();
      return false;
    }
  }

  bool checkIfAdded(String pdtid, String name, double price, String imageUrl) {
    if(_items.containsKey(pdtid)) {
      return true;
    } else {
      return false;
    }
  }

  void removeItem(String id) {
    _items.remove(id);
    notifyListeners();
  }

  void removeSingleItem(String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}