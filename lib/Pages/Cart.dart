import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_ui_6/Bloc/cartListBloc.dart';
import 'package:restaurant_ui_6/Model/Items.dart';
import 'package:restaurant_ui_6/Style/Colors.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();
    List<Item> items;
    return StreamBuilder(
      stream: bloc.listStream,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          items = snapshot.data;
          return Scaffold(
            body: SafeArea(
              child: CartBody(items),
            ),
            bottomNavigationBar: BottomBar(items),
          );
        } else {
          return Container(
            child: Text("Something returned null"),
          );
        }
      },
    );
  }
}

class BottomBar extends StatelessWidget {
  final List<Item> items;

  BottomBar(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 35, bottom: 25),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          totalAmount(items),
          nextButtonBar(),
        ],
      ),
    );
  }

  Container totalAmount(List<Item> items) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Total:",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
          ),
          Text(
            "\$${returnTotalAmount(items)}",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
          ),
        ],
      ),
    );
  }

  String returnTotalAmount(List<Item> items) {
    double totalAmount = 0.0;

    for (int i = 0; i < items.length; i++) {
      totalAmount = totalAmount + items[i].price * items[i].quantity;
    }
    return totalAmount.toStringAsFixed(2);
  }

  Container nextButtonBar() {
    return Container(
      width: 600,
      margin: EdgeInsets.only(right: 25),
      padding: EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: buttonGreenColor, borderRadius: BorderRadius.circular(15)),
      child: Center(
              child: Text(
          "Next",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class CartBody extends StatelessWidget {
  final List<Item> items;

  CartBody(this.items);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(35, 40, 25, 0),
      child: Column(
        children: <Widget>[
          CustomAppBar(),
          title(),
          Expanded(
            flex: 1,
            child: items.length > 0 ? itemList() : noItemContainer(),
          )
        ],
      ),
    );
  }

  Container noItemContainer() {
    return Container(
      child: Center(
        child: Text(
          "No More Items Left In The Cart",
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey[500],
              fontSize: 20),
        ),
      ),
    );
  }

  ListView itemList() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return CartListItem(item: items[index]);
      },
    );
  }

  Widget title() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "My",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                ),
              ),
              Text(
                "Order",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 35,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CartListItem extends StatelessWidget {
  final Item item;
  CartListItem({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: ItemContent(item: item,),
    );
  }
}


class ItemContent extends StatelessWidget {
  const ItemContent({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Item item;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(item.imgUrl),
                fit: BoxFit.fill
              )
            ),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700),
                children: [
                  TextSpan(
                    text: item.name,
                  ),
                ]),
          ),
          Text('x'),
          Text(
            item.quantity.toString()
          ),
          Text(
            "\$${item.quantity * item.price}",
            style:
                TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}



class CustomAppBar extends StatelessWidget {
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            child: Icon(
              CupertinoIcons.back,
              size: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
