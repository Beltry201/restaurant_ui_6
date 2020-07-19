import 'package:flutter/material.dart';
import 'package:restaurant_ui_6/Bloc/cartListBloc.dart';
import 'package:restaurant_ui_6/Model/Items.dart';
import 'package:restaurant_ui_6/Style/Colors.dart';
import 'package:bloc_pattern/bloc_pattern.dart';


class DetailScreen extends StatelessWidget {
  
  DetailScreen({
    @required this.itemPrice,
    @required this.itemName,
    @required this.imgUrl,
    @required this.ingredients,
    @required this.item
  });

  final double itemPrice;
  final String itemName;
  final String imgUrl;
  final String ingredients;
  final Item item;

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pop();
            }
          ),
          title: Text(
            'Details',
            style: TextStyle(
              fontFamily: 'PlayfairDisplay',
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.w600
            ),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            WhiteContainer(imgUrl: imgUrl),
            Texts(
              ingredients: ingredients,
              itemName: itemName,
              itemPrice: itemPrice,
            ),
            AddButton(
              itemName: itemName, 
              item: item
            )
          ],
        ),
      ),
    );
  }
}

class Texts extends StatelessWidget {
  Texts({
    @required this.itemName,
    @required this.itemPrice,
    @required this.ingredients
  });

  final String ingredients;
  final double itemPrice;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned( //Bowl name
          top: 260.0,
          left: 40.0,
          right: 25.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: (itemName),
                    style: TextStyle(
                      fontFamily: 'PlayfairDisplay',
                      fontSize: 27,
                      color: Colors.black87
                    ),
                  children: <TextSpan>[
                    TextSpan(
                      text: ' BOWL',
                      style: TextStyle(
                        fontFamily: 'PlayfairDisplay',
                        fontSize: 27,
                        color: Colors.black
                      )
                    )
                  ]
                ),
              )
            ]
          )
        ),
        Positioned( // Item price
          top: 320.0,
          left: 40.0,
          right: 25.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("\$$itemPrice",
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 27,
                  fontWeight: FontWeight.w100
                )
              )
            ]
          )
        ),
        Positioned( //Item ingredients
          top: 390.0,
          left: 40.0,
          right: 25.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(ingredients,
                style: TextStyle(
                  fontFamily: 'PlayfairDisplay',
                  fontSize: 17.0,
                )
              )
            ]
          )
        ),
      ]
    );
  }
}

class WhiteContainer extends StatelessWidget {
  //White rounded Space

  WhiteContainer({@required this.imgUrl});

  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height - 70.0,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent
        ),
        Positioned(
          top: 105.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
              color: Colors.white),
            height: MediaQuery.of(context).size.height - 100.0,
            width: MediaQuery.of(context).size.width
          )
        ),
        Positioned( //image
          top: 30.0,
          left: (MediaQuery.of(context).size.width / 2) - 100.0,              
          height: 200.0,
          width: 200.0,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 27,
                  offset: Offset(7, 23))
              ],
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imgUrl), 
                fit: BoxFit.fill
              )
            ),
          )
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  CustomButton({@required this.onPressed});
  final GestureTapCallback onPressed;


 
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      fillColor: buttonGreenColor,
      splashColor: buttonGreenColor,
      padding: EdgeInsets.only(left: 50,right: 50,),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text(
          "Add",
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'PlayfairDisplay',
            fontSize: 26
          ),
        ),
      ),
      onPressed: onPressed,
      shape: StadiumBorder(),
    );
  }
}


class AddButton extends StatelessWidget {
  @override

  AddButton({
    @required this.itemName,
    @required this.item
  });

  final String itemName;
  final Item item;
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();


  addToCartList(Item item) {
    bloc.addToList(item);
  }

  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0,0.85),
      child: CustomButton(
        onPressed: () {
          addToCartList(item);
          final snackBar = SnackBar(
            content: RichText(
              text: TextSpan(
                text: (itemName).toLowerCase(), 
                children: <TextSpan>[
                  TextSpan(
                    text: ' bowl has been added',
                  )
                ]
              ),
            ),
            duration: Duration(seconds: 1),
          );
          Scaffold.of(context).showSnackBar(snackBar);
        },
        // child: Container(
        //   height: 60,
        //   width: 220,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(38),
        //     color: Colors.greenAccent[400],
        //   ),
        //   child: Center(
        //     child: Text(
        //       'Add',
        //       style: TextStyle(
        //         fontFamily: 'PlayfairDisplay',
        //         fontSize: 26,
        //         color: Colors.white,
        //         fontWeight: FontWeight.w800,
        //         letterSpacing: 3
        //       ),
        //     ),
        //   ),
        // )
      ),
    );
  }
}
