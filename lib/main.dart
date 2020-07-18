import 'package:flutter/material.dart';
import 'package:restaurant_ui_6/Bloc/cartListBloc.dart';
import 'package:restaurant_ui_6/Pages/Home.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i)=>CartListBloc() )
      ],
      child: MaterialApp(
        title: 'Restaurant_ui_5',
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
