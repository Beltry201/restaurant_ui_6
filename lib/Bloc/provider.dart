import 'package:restaurant_ui_6/Model/Items.dart';

class CartProvider {
  List<Item> items = [];

  List<Item> addToList(Item item) {
    bool isPresent = false;

    if(items.length > 0) {
      for(int i = 0; i < items.length; i++){
        if (items[i].id == item.id) {
          increaseItemQuantity(item);
          isPresent = true;
          break;
        }
        else {
          isPresent = false;
        }
      }

      if(!isPresent) {
        items.add(item);
      }
    }
    else{
      items.add(item);
    }
    return items;
  }

  List<Item> removeFromList(Item item) {
    if (item.quantity > 1) {
      decreaseItemQuantity(item);
    }
    else{
      items.remove(item);
    }
    return items;
  }
  void increaseItemQuantity(Item item) =>item.addQuantity();
  void decreaseItemQuantity(Item item) =>item.subQuantity();
}
