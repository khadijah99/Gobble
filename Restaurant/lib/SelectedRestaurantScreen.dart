import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_star_rating/flutter_star_rating.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restaurantchooser/FoodItems.dart';
import 'package:restaurantchooser/ReviewComments.dart';

import 'Buttoons.dart';
import 'EditCustomerInfo.dart';

class SelectedRestaurantScreen extends StatefulWidget {
  @override
  _SelectedRestaurantScreenState createState() =>
      _SelectedRestaurantScreenState();
}

class _SelectedRestaurantScreenState extends State<SelectedRestaurantScreen> {
  String restaurantName = "McDonalds";
  bool reservation = false;
  bool order;
  double avgRating = 3;
  double ratings;
  String comment;
  int chairs = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff9a1bc),
        title: Text(
          restaurantName,
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
        // actions: <Widget>[
        //   IconButton(
        //   icon: Icon(Icons.add),
        //   color: Colors.white, onPressed: () {},),
        // ],
      ),

      body: ListView(
        children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Center(child: Image.asset("assets/logo_transparent.png", height: 150,)),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15 ),
              child: Center(
                child: StarRating(
                  starConfig: StarConfig(
                  fillColor : Color(0xfff9a1bc),
                  size: 20,
                  strokeColor: Colors.white,
                  raysCount: 5,
                  ),            
                  rating: avgRating,
                ),
              ),
            ),
              Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: CircularButtonSmall(height: 50, width: 190,name: "Reserve Table",fontSize: 20, color: Color(0xfff9a1bc),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
            
              Text("No. of chairs: ",style: TextStyle(color: Color(0xffc73f65), fontSize: 17,fontWeight: FontWeight.bold)),
              Container(
                        height: 40,
                        width: 140,
                        child: TextField1(
                          hintText: chairs.toString(),
                          labelText: "Chairs",
                          icon: Icon(FontAwesomeIcons.chair, color: Color(0xfff9a1bc)),
                          color: Color(0xfff9a1bc),
                          input: TextInputType.number,
                        )),

            ],),

            Center(
               child: Padding(
                padding: EdgeInsets.only( top: 40, bottom: 0),
                child: Text("Food Items",
                    style: TextStyle(color: Color(0xffc73f65), fontSize: 25,fontWeight: FontWeight.bold)),
            ),
             ),
            FoodItemCard(name: "Pizza", category: "Fast Food", price: 12, ingredients: "Cheese, pepperoni, olives, mushroom, onions", buttonText: "Add to Cart",),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: CircularButtonSmall(height: 50, width: 210,name: "Proceed to Cart",fontSize: 20, color: Color(0xfff9a1bc),),
            ),
            Center(
               child: Padding(
                padding: EdgeInsets.only( top: 40, bottom: 0),
                child: Text("Reviews",
                    style: TextStyle(color: Color(0xffc73f65), fontSize: 25,fontWeight: FontWeight.bold)),
            ),
             ),
            ReviewComments(comment: "yum?",ratings: 3, customerName: "Khadija", color: Color(0xfff9a1bc),)
        ],
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                title: RatingBar(
                  itemSize: 30,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Color(0xfff9a1bc),
                  ),
                  onRatingUpdate: (rat) {
                    
                    ratings = rat;
                  },
                ),
                content: Column(
                  children: <Widget>[
                    Text("Write a review"),
                    Card(
                      child: TextField(
                        onChanged: (String a) {
                          comment = a;
                        },
                      ),
                    )
                  ],
                ),
                actions: <Widget>[
                  // usually buttons at the bottom of the dialog
                  new FlatButton(
                    child: new Text("POST"),
                    onPressed: () {
                        //InsertReview();
                        Navigator.pop(context);
                      
                    },
                  ),
                ],
              );
            },
          );
      },
      child: Icon(Icons.rate_review),
      backgroundColor: Color(0xffc73f65),
    ),
  );
  }
}
