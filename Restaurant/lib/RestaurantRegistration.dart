// // import 'dart:io';
// //import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart' as sql;
import 'package:restaurantchooser/CustomerLogin.dart';
import 'package:restaurantchooser/CustomerRegistration.dart';
import 'package:restaurantchooser/DinningTable.dart';
import 'package:restaurantchooser/ManagerLogin.dart' as ma;
import 'Buttoons.dart';

class RestaurantRegistration extends StatefulWidget {
  final int managerID;
  final List<String> cities;

  RestaurantRegistration({
    Key key,
    this.managerID,
    this.cities,
  }) : super(key: key);
  @override
  _RestaurantRegistrationState createState() =>
      _RestaurantRegistrationState(managerID, cities);
}

class _RestaurantRegistrationState extends State<RestaurantRegistration> {
  bool reservation = false;
  bool order = false;

  String resName;
  String plotNo;
  String streetNo;
  String iban;
  bool tableRes;
  bool onlineOrder;

  var listOfFields = <Widget>[];

  var managerID;

  var cities;

  _RestaurantRegistrationState(this.managerID, this.cities);
  void addNewField() {
    setState(() {
      listOfFields.add(TextFields());
    });
  }

//  List<String> _locations = [
//     'Please choose a city',
//     'Islamabad',
//     'Lahore',
//     'Karachi',
//     'Peshawar'
//   ]; // Option 1 List for options e.g cities
  String _selectedLocation =
      'Islamabad'; // Option 1 the slected option get?  get?

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
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFieldss(
                onchanged: (String a) {
                  resName = a;
                },
                hintText: "Restaurant Name",
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
                        child: TextFields(
                          onchanged: (String a) {
                            plotNo = a;
                          },
                          hintText: "Plot#",
                          icon: Icon(Icons.home, color: Color(0xffc73f65)),
                          color: Color(0xffc73f65),
                          input: TextInputType.number,
                        )),
                    Container(
                      height: 40,
                      width: 130,
                      child: TextFields(
                        onchanged: (String a) {
                          streetNo = a;
                        },
                        hintText: "Street#",
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
              padding: EdgeInsets.only(top: 0, bottom: 20, left: 44, right: 44),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                  child: DropdownButton(
                    value: _selectedLocation,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedLocation =
                            newValue; //setting new value, newValue is the one we get from the user and putting that equal to the one we declared at top
                      });
                    },
                    items: widget.cities.map((location) {
                      //Passing the list we crated of cities to a dropdwon menu and it has child with location that is at top
                      return DropdownMenuItem(
                        child: new Text(location),
                        value: location,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                      onchanged: (String a) {
                        iban = a;
                      },
                      hintText: "IBAN",
                      icon:
                          Icon(Icons.account_balance, color: Color(0xffc73f65)),
                      color: Color(0xffc73f65),
                      labelText: "IBAN",
                      input: TextInputType.emailAddress)),
            ),
            Padding(
              padding: EdgeInsets.only(left: 45, top: 0, right: 45, bottom: 0),
              child: Container(
                height: 100,
                width: 80,
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: reservation,
                      onChanged: (bool value) {
                        setState(() {
                          reservation = value;
                        });
                      },
                    ),
                    Text("Table Reservation"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 45, top: 0, right: 45, bottom: 0),
              child: Container(
                height: 100,
                width: 80,
                child: Row(
                  children: <Widget>[
                    Checkbox(
                      value: order,
                      onChanged: (bool value) {
                        setState(() {
                          order = value;
                        });
                      },
                    ),
                    Text("Online Order"),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: CircularButton(
                onPressed: () async {
                  var settings = new sql.ConnectionSettings(
                      host: 'remotemysql.com',
                      port: 3306,
                      user: 'Sux7Sc8dpV',
                      password: '5FMS0XeiRk',
                      db: 'Sux7Sc8dpV');
                  var conn = await sql.MySqlConnection.connect(settings);
                  int cityIds;
                  var city = await conn.query(
                      'select idCity from City where Name = "$_selectedLocation" ');
                    int cityloop;
                  for (var row in city) {
                    cityloop= row[0];
                  }
                  cityIds = cityloop;
                  
                  int plot = int.parse(plotNo);
                  int street = int.parse(streetNo);

                  await conn.query(
                      'insert into Address values (null,"$plot", "$street", "$cityIds")');

                  var address = await conn
                      .query("select Address.Address_id from Address");
                  int addressId;
                  for (var row in address) {
                    addressId = row[0];
                  }

                  print("address IDD");
                  

                  int id = widget.managerID;
                 
                  int res = boolconverter(reservation);
                  int ord = boolconverter(order);
                  await conn.query(
                      'insert into Restaurant values (null, "$addressId", "$resName", "$res", "$ord", "$id", "$iban" )');

                  int restID;
                   var rest = await conn
                      .query('select Restaurant.Restaurant_id from Restaurant');
                int restss;
                  for (var row in rest) {
                    restss = row[0];
                    
                  }
                    restID = restss;

                    print(restID);
                    
                    conn.close();

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DinningTable(
                      restaurantId: restID,

                    );
                  }));
                },
                name: "Add Tables",
                fontSize: 20,
                color: Color(0xffc73f65),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


int boolconverter(bool a){
  if (a == true)
  return 1;
  else 
  return 0;

}
