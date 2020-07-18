import 'package:flutter/material.dart';
import 'package:restaurant_ui_6/Style/Colors.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key key}) : super(key: key);

  // CartScreen({
  // @required this.imgUrl,
  // @required this.itemName,
  // @required this.itemPrice
  // });

  // final double itemPrice;
  // final String itemName;
  // final String imgUrl;

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColor,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(
          height: 110,
          child: Stack(
            children: <Widget>[
              Title(),
              BackIcon()
            ],
          )
        ),
      ),
    );
  }
}

class CustomAppBar extends PreferredSize {
  final Widget child;
  final double height;

  CustomAppBar({@required this.child, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 10,
              blurRadius: 10
            )
          ]
        ),
      height: preferredSize.height,
      alignment: Alignment.center,
      child: child,
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(0),
      child: Container(
        child: Align(
          alignment: Alignment(0,-1),
          child: Text(
            'Tu Carrito',
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 40,
              color: titleGreyColor
            ),
          ),
        ),
      ),
    );
  }
}

class BackIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(-0.9, 0.2),
        child: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        color: titleGreyColor,
        onPressed: () {
          Navigator.of(context).pop();
        }
      ),
    );
  }
}