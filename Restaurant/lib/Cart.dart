import 'package:flutter/material.dart';
import 'package:restaurantchooser/Buttoons.dart';
import 'FoodItems.dart';
import 'TextStyle.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  double totalPrice;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff9a1bc),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          FoodItemCard(
            name: "Pizza",
            price: 430,
            category: "FastFood",
            ingredients: "Cheese,Onions,oks",
            buttonText: "Remove",
          ),
          Padding(
            padding: EdgeInsets.only(left: 240,top: 8, bottom: 8),
            child: Text(
              "Total : " + totalPrice.toString(),
              style: t1,
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: CircularButtonSmall(name: "Order",fontSize: 20, color: Color(0xfff9a1bc),height: 50, width:120),
            ),
        ],
      ),
    );
  }
}
