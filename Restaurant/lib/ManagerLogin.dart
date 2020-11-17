import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart' as sql;
import 'package:restaurantchooser/ManagerHome.dart';
import 'package:restaurantchooser/ManagerRegistration.dart';
import 'Buttoons.dart';
import 'ChooseLogin.dart';

class ManagerLogin extends StatefulWidget {
  @override
  _ManagerLoginState createState() => _ManagerLoginState();
}

class _ManagerLoginState extends State<ManagerLogin> {
  String email;
  String password;
  int managerID;
  double average;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Center(
                  child: Image.asset(
                "ManagerAssets/logo_transparent.png",
                height: 350,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: TextFields(
                onchanged: (String a) {
                  email = a;
                },
                hintText: "Email",
                icon: Icon(Icons.email, color: Color(0xffc73f65)),
                color: Color(0xfff9a1bc),
                labelText: "Email",
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Center(
                  child: new TextFields(
                onchanged: (String a) {
                  password = a;
                },
                hintText: "Password",
                // hide: true,
                icon: Icon(
                  Icons.lock_open,
                  color: Color(0xffc73f65),
                ),
                color: Color(0xfff9a1bc),
                labelText: "Password",
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: CircularButton(
                name: "Login",
                fontSize: 20,
                color: Color(0xffc73f65),
                onPressed: () async {
                  var settings = new sql.ConnectionSettings(
                      host: 'remotemysql.com',
                      port: 3306,
                      user: 'Sux7Sc8dpV',
                      password: '5FMS0XeiRk',
                      db: 'Sux7Sc8dpV');
                  var conn = await sql.MySqlConnection.connect(settings);

                  var result = await conn.query(
                      'select RestaurantManager.email,RestaurantManager.password,RestaurantManager.username,RestaurantManager.Manager_id from RestaurantManager where RestaurantManager.email = "$email" and RestaurantManager.password = "$password"');

                  for (var row in result) {
                    managerID = await row[3];
                  }

                  var av = await conn.query(
                      'SELECT Restaurant.Restaurant_id, AVG(Rating) from Restaurant, Reviews, RestaurantManager where RestaurantManager.Manager_id = Restaurant.RestaurantManager_Manager_id and Restaurant.Restaurant_id = Reviews.Restaurant_Restaurant_id and Restaurant.RestaurantManager_Manager_id = "$managerID" GROUP by Restaurant_Restaurant_id');

                  for (var row in av) {
                    average = row[1];
                  }

                  conn.close();

                  if (result.length == 1) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return ManagerHome(
                        managerId: managerID,
                        averageRating: average,
                      );
                    }));
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // return object of type Dialog
                          return AlertDialog(
                            title: Text("Password Incorrect"),
                          );
                        });
                  }
                },
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: Text(
                    "Don't have an account?",
                    style: TextStyle(color: Color(0xffc73f65), fontSize: 14),
                  )),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ManagerRegistration();
                          }));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Color(0xffc73f65),
                              fontSize: 14,
                              decoration: TextDecoration.underline),
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFields extends StatelessWidget {
  String hintText;
  Icon icon;
  Color color;
  String labelText;
  TextInputType input;
  Function onchanged;
  bool hide;
  TextFields(
      {Key key,
      this.color,
      this.hintText,
      this.onchanged,
      //  this.hide,
      this.icon,
      this.input,
      this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: input,
      onChanged: onchanged,
      // obscureText: hide,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xffc73f65)),
          icon: icon,
          fillColor: color,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
          )),
    );
  }
}
