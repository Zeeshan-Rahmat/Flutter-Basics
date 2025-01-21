import 'package:flutter_basics/models/catalog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartModal {
  final List<Item> _items = [];

  // Get Itemd
  List<Item> get items => _items;

  // Get Total Price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add to Cart
  void addToCart(Item item) {
    _items.add(item);
  }

  // Add to Cart
  void removeFromCart(Item item) {
    _items.remove(item);
  }
}

class CartNotifier extends StateNotifier<CartModal> {
  CartNotifier(super.state);

  void addItem(Item item) {
    state.addToCart(item);
  }

  void removeItem(Item item) {
    state.removeFromCart(item);
  }
}
