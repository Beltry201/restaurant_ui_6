import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:restaurant_ui_6/Pages/Details.dart';

ItemList itemList = ItemList(items: [
  Item(
    id: 1,
    name: 'VIRGINIA',
    ingredients:
        'The Arch of Remembrance is a First World War memorial designed by Sir Edwin Lutyens and located in Victoria Park, Leicester, in the East Midlands of England. A committee was formed in 1919 to propose a permanent memorial, and the first proposal was accepted, but eventually cancelled due to a shortage of funds.',
    price: 10,
    imgUrl:
        'https://img.buzzfeed.com/video-api-prod/assets/611fa066ddb445b282cbed439031694d/BFV8528_ChurroIceCreamBowl-Thumb1080SQ.jpg',
  ),
  Item(
    id: 2,
    name: 'BANANA',
    ingredients:
        'The Arch of Remembrance is a First World War memorial designed by Sir Edwin Lutyens and located in Victoria Park, Leicester, in the East Midlands of England. A committee was formed in 1919 to propose a permanent memorial, and the first proposal was accepted, but eventually cancelled due to a shortage of funds.',
    price: 20,
    imgUrl:
        'https://img.buzzfeed.com/video-api-prod/assets/611fa066ddb445b282cbed439031694d/BFV8528_ChurroIceCreamBowl-Thumb1080SQ.jpg',
  ),
  Item(
    id: 3,
    name: 'DIEGO',
    ingredients:
        'The Arch of Remembrance is a First World War memorial designed by Sir Edwin Lutyens and located in Victoria Park, Leicester, in the East Midlands of England. A committee was formed in 1919 to propose a permanent memorial, and the first proposal was accepted, but eventually cancelled due to a shortage of funds.',
    price: 30,
    imgUrl:
        'https://img.buzzfeed.com/video-api-prod/assets/611fa066ddb445b282cbed439031694d/BFV8528_ChurroIceCreamBowl-Thumb1080SQ.jpg',
  ),
  Item(
    id: 4,
    name: 'JULIAN',
    ingredients:
        'The Arch of Remembrance is a First World War memorial designed by Sir Edwin Lutyens and located in Victoria Park, Leicester, in the East Midlands of England. A committee was formed in 1919 to propose a permanent memorial, and the first proposal was accepted, but eventually cancelled due to a shortage of funds.',
    price: 40,
    imgUrl:
        'https://img.buzzfeed.com/video-api-prod/assets/611fa066ddb445b282cbed439031694d/BFV8528_ChurroIceCreamBowl-Thumb1080SQ.jpg',
  ),
  Item(
    id: 5,
    name: 'MARIA',
    ingredients:
        'The Arch of Remembrance is a First World War memorial designed by Sir Edwin Lutyens and located in Victoria Park, Leicester, in the East Midlands of England. A committee was formed in 1919 to propose a permanent memorial, and the first proposal was accepted, but eventually cancelled due to a shortage of funds.',
    price: 50,
    imgUrl:
        'https://img.buzzfeed.com/video-api-prod/assets/611fa066ddb445b282cbed439031694d/BFV8528_ChurroIceCreamBowl-Thumb1080SQ.jpg',
  ),
  Item(
    id: 6,
    name: 'BELTRY',
    ingredients:
        'The Arch of Remembrance is a First World War memorial designed by Sir Edwin Lutyens and located in Victoria Park, Leicester, in the East Midlands of England. A committee was formed in 1919 to propose a permanent memorial, and the first proposal was accepted, but eventually cancelled due to a shortage of funds.',
    price: 100,
    imgUrl:
        'https://img.buzzfeed.com/video-api-prod/assets/611fa066ddb445b282cbed439031694d/BFV8528_ChurroIceCreamBowl-Thumb1080SQ.jpg',
  )
]);

class ItemList {
  List<Item> items;

  ItemList({@required this.items});
}

class Item {
  int id;
  String name;
  String ingredients;
  double price;
  String imgUrl;
  int quantity;

  Item(
      {@required this.id,
      @required this.name,
      @required this.ingredients,
      @required this.price,
      @required this.imgUrl,
      this.quantity = 1});

  void addQuantity() {
    this.quantity = this.quantity + 1;
  } //Suma 1 a la cantidad de item

  void subQuantity() {
    this.quantity = this.quantity - 1;
  } //Resta 1 a la cantidad de itam
}

class ItemContainer extends StatelessWidget {
  final Item item;

  ItemContainer({@required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, MaterialPageRoute(
            builder: (context) {
              return DetailScreen(
                itemName: item.name,
                itemPrice: item.price,
                imgUrl: item.imgUrl,
                ingredients: item.ingredients,
                item: item,
              );
            }
          )
        );
      },
      child: Items(
        itemName: item.name,
        itemPrice: item.price,
        imgUrl: item.imgUrl,
      )
    );
  }
}

class Items extends StatelessWidget {
  Items(
      {@required this.itemPrice,
      @required this.itemName,
      @required this.imgUrl});

  final double itemPrice;
  final String itemName;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              Container( //White Container
                padding: EdgeInsets.all(10),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 10)
                    )
                  ],
                ),
                child: Stack(
                  children: <Widget>[
                    Container(
                      // Image
                      width: 80,
                      height: 80,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          imgUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      // Text
                      padding: EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          itemName,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'PlayfairDisplay',
                            fontSize: 13,
                            color: Colors.black,
                            letterSpacing: 3),
                        )
                      )
                    ),
                    Container(// Text
                      padding: EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("\$$itemPrice",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black54,
                            letterSpacing: 3
                          )
                        )
                      )
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
