// // import 'dart:io';
// //import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:restaurantchooser/CustomerLogin.dart';
import 'package:restaurantchooser/CustomerRegistration.dart';
import 'package:restaurantchooser/MyTextFields.dart';
import 'Buttoons.dart';


class EditRestaurant extends StatefulWidget {
  final String restaurantName;
  final int plot;
  final int street;
  final String city;
  final String bankacc;
  final int reservation;
  final int noOfTables;
final int online;

  const EditRestaurant({Key key, this.restaurantName, this.plot, this.street, this.city, this.bankacc, this.reservation, this.noOfTables, this.online}) : super(key: key);
  



  @override
  _EditRestaurant createState() => _EditRestaurant(restaurantName,plot,street,city,bankacc,reservation,noOfTables,online, );
}

class _EditRestaurant extends State<EditRestaurant> {

  int reservation ;
 
  static String city = "Islamabad";
  int plot;
  int street;
  int tables;

  
var listOfFields = <Widget>[];

  String bakacc;
String name;

  int noOfTables;
  final String cityy;

  int order;

  

  _EditRestaurant(this.name, this.plot, this.street, this.cityy, this.bakacc,this.reservation,this.noOfTables, this.order,);
void addNewField(){
   setState((){
   listOfFields.add(TextFields());
   });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffc73f65),
        title: Text(
          'Restaurant',
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
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25, top: 15, bottom: 10),
              child: Text("Restaurant Name",
                  style: TextStyle(color: Color(0xffc73f65), fontSize: 18)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFieldDisabled(
                hintText: widget.restaurantName,
                icon: Icon(Icons.restaurant, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 15, bottom: 0),
              child: Text("Address",
                  style: TextStyle(color: Color(0xffc73f65), fontSize: 18)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 45, top: 0, right: 45, bottom: 0),
              child: Container(
                height: 100,
                width: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        height: 40,
                        width: 130,
                        child: TextFieldDisabled(
                          hintText: widget.plot.toString(),
                          icon: Icon(Icons.home, color: Color(0xffc73f65)),
                          color: Color(0xffc73f65),
                          input: TextInputType.number,
                        )),
                    Container(
                      height: 40,
                      width: 130,
                      child: TextFieldDisabled(
                        hintText: widget.street.toString(),
                        icon:
                            Icon(Icons.nature_people, color: Color(0xffc73f65)),
                        color: Color(0xffc73f65),
                        input: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, bottom: 20, left: 44, right: 44),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                  child: Text("City: "+widget.city.toString(),
                  style: TextStyle(color: Color(0xffc73f65), fontSize: 20)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 15, bottom: 10),
              child: Text("Bank Account Number",
                  style: TextStyle(color: Color(0xffc73f65), fontSize: 18)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFieldDisabled(
                hintText: widget.bankacc,
                icon: Icon(Icons.account_balance, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                input: TextInputType.emailAddress
              )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 20, bottom: 0),
              child: Text("Table Reservation: "+widget.reservation.toString(),
                  style: TextStyle(color: Color(0xffc73f65), fontSize: 14)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 15, bottom: 0),
              child: Text("Online Order: "+widget.online.toString(),
                  style: TextStyle(color: Color(0xffc73f65), fontSize: 14)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 15, bottom: 0),
              child: Text("No. of tables: "+ widget.noOfTables.toString(),
                  style: TextStyle(color: Color(0xffc73f65), fontSize: 14)),
            ),
                
          ],
        ),
      ),
    );
  }
}

String boolconverter(bool a){
  
}