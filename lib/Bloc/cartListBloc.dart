import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:restaurant_ui_6/Bloc/provider.dart';
import 'package:restaurant_ui_6/Model/Items.dart';
import 'package:rxdart/rxdart.dart';

class CartListBloc extends BlocBase {
  CartListBloc();

  var _listController = BehaviorSubject<List<Item>>.seeded([]);

//provider class
  CartProvider provider = CartProvider();

//output
  Stream<List<Item>> get listStream => _listController.stream;

//input
  Sink<List<Item>> get listSink => _listController.sink;

  addToList(Item item) {
    listSink.add(provider.addToList(item));
  }

  removeFromList(Item item) {
    listSink.add(provider.removeFromList(item));
    
  }

//dispose will be called automatically by closing its streams
  @override
  void dispose() {
    _listController.close();
    super.dispose();
  }
}