import 'package:flutter/material.dart';
import 'package:restaurant_ui_6/Pages/Cart.dart';
import 'package:restaurant_ui_6/Style/Colors.dart';
import 'package:restaurant_ui_6/Model/Items.dart';

class Home extends StatelessWidget {
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
          height: 180,
          child:Stack(
            children: <Widget>[
              BrandName(), 
              Slogan(), CartIcon()
            ]
          )
        ),
        body: ListView(
          children: <Widget>[
            for (var item in itemList.items)
            Builder(
              builder: (context) {
                return ItemContainer(item: item);
              },
            )
          ],
        )
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
                blurRadius: 10)
          ]),
      height: preferredSize.height,
      alignment: Alignment.center,
      child: child,
    );
  }
}

class BrandName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(0),
      child: Container(
        child: Align(
          alignment: Alignment(-0.8, -0.4),
          child: Text(
            'De La Mora',
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 40,
              color: titleGreyColor
            ),
          ),
        )
      ),
    );
  }
}

class Slogan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.all(0),
      child: Container(
          child: Align(
        alignment: Alignment(-0.78, 0.2),
        child: Text(
          'La Casa Del Nice-Cream',
          style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              fontSize: 16,
              color: subtitleGreyColor,
              letterSpacing: 1.2),
        ),
      )),
    );
  }
}

class CartIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0.7, 0.28),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart()));
        },
        child: Icon(
          Icons.shopping_cart,
          color: titleGreyColor,
          size: 30,
        ),
      ),
    );
  }
}
