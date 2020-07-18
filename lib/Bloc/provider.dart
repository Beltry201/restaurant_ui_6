import 'package:restaurant_ui_6/Model/Items.dart';

class CartProvider {
  List<Item> items = [];

  List<Item> addToList(Item item) {
    items.add(item);
    return items;
  }

  List<Item> removeFromList(Item item) {
    items.remove(item);
    return items;
  }
}
