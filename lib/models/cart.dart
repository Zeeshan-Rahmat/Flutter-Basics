import 'package:flutter_basics/models/catalog.dart';

class CartModal {
  late CatalogModel _catalog;

  final List<int> _itemsIDs = [];

  // Get Catalog
  CatalogModel get getCatalog => _catalog;

  // Set Catalog
  set setCatalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  // Get Itemd
  List<Item> get items => _itemsIDs.map((id) => _catalog.getByID(id)).toList();

  // Get Total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add to Cart
  void addToCart(int id) {
    _itemsIDs.add(id);
  }

  // Add to Cart
  void removeFromCart(int id) {
    _itemsIDs.remove(id);
  }
}
