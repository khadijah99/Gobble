import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:restaurantchooser/ChooseLogin.dart';
import 'package:restaurantchooser/CustomerLogin.dart';
import 'package:flutter_date_picker/flutter_date_picker.dart';
import 'package:flutter_date_picker/flutter_time_picker.dart';
import 'package:restaurantchooser/RestaurantRegistration.dart';
import 'package:restaurantchooser/time_date.dart';
import 'Buttoons.dart';
import 'CustomerRegistration.dart';

class ManagerRegistration extends StatefulWidget {
  @override
  _ManagerRegistrationState createState() => _ManagerRegistrationState();
}

class _ManagerRegistrationState extends State<ManagerRegistration> {
  insertManagerDetails() async {
    var settings = new ConnectionSettings(
        host: 'remotemysql.com',
        port: 3306,
        user: 'Sux7Sc8dpV',
        password: '5FMS0XeiRke',
        db: 'Sux7Sc8dpV');
    var conn = await MySqlConnection.connect(settings);

    var result = await conn.query(
        'select RestaurantManager.email,RestaurantManager.password,RestaurantManager.username where RestaurantManager.email = $email and RestaurantManager.password = $password and RestaurantManager.username = $username');
        conn.close();
  }

  String firstName;
  String lastName;
  String username;
  String email;
  String password;
  String contactNo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffc73f65),
        title: Text(
          'Register',
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
            Image.asset(
              "ManagerAssets/logo_transparent.png",
              height: 150,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                onchanged: (String a) {
                  firstName = a;
                },
                hintText: "First Name",
                icon: Icon(Icons.person, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                labelText: "First Name",
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                onchanged: (String a) {
                  lastName = a;
                },
                hintText: "Last Name",
                icon: Icon(Icons.person, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                labelText: "Last Name",
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                onchanged: (String a) {
                  username = a;
                },
                hintText: "Username",
                icon: Icon(Icons.assignment_ind, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                labelText: "Username",
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                onchanged: (String a) {
                  password = a;
                },
                hintText: "Password",
                icon: Icon(Icons.lock, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                labelText: "Password",
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                onchanged: (String a) {
                  email = a;
                },
                hintText: "Email",
                icon: Icon(Icons.alternate_email, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                labelText: "Email",
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                onchanged: (String a) {
                  contactNo = a;
                },
                hintText: "Contact Number",
                icon: Icon(Icons.contact_phone, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                labelText: "Contact Number",
                input: TextInputType.number,
              )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: CircularButton(
                onPressed: () async {
                  var settings = new ConnectionSettings(
                      host: 'remotemysql.com',
                      port: 3306,
                      user: 'Sux7Sc8dpV',
                      password: '5FMS0XeiRk',
                      db: 'Sux7Sc8dpV');
                  var conn = await MySqlConnection.connect(settings);

                  var result = await conn.query(
                      'select RestaurantManager.email,RestaurantManager.password,RestaurantManager.username from RestaurantManager where RestaurantManager.email = "$email" or RestaurantManager.username = "$username"');


                if (result.length != 0){
                  showDialog(
            context: context,
            builder: (BuildContext context) {
              // return object of type Dialog
              return AlertDialog(
                title: Text("Username or Email already exists"),
              );
            }
                  );
                
                  
                  

                } 

                else {
                  List<String> cities = [];
                  int con = int.parse(contactNo);
                  await conn.query('INSERT into RestaurantManager values (null,"$firstName","$lastName","$username","$email","$password","$con")');
                  var result = await conn.query('select Manager_id from RestaurantManager where Username = "$username"');
                  var resultnew = await conn.query('select City.Name from City');

                  for (var row in resultnew){
                    cities.add(row[0]);
                  }

                  int userId;
                  for (var row in result){
                      userId= await row[0];
                  }

                  conn.close();
                  
                 Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RestaurantRegistration(managerID: userId, cities : cities);
                }));
                 

                }     
                },
                name: "Register",
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
