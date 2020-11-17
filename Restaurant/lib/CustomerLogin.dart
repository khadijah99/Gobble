import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart' as sql;
import 'Buttoons.dart';
import 'CustomerHome.dart';

class CustomerLogin extends StatefulWidget {
  @override
  _CustomerLoginState createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {
  String email;
  String password;
  int custID;

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
                "assets/logo_transparent.png",
                height: 350,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                hintText: "Email",
                icon: Icon(Icons.email, color: Color(0xfff9a1bc)),
                color: Color(0xfff9a1bc),
                labelText: "Email",
                input: TextInputType.emailAddress,
                onchanged: (value) {
                  email = value;
                },
              )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Center(
                  child: new TextFields(
                      hintText: "Password",
                      icon: Icon(
                        Icons.lock_open,
                        color: Color(0xfff9a1bc),
                      ),
                      color: Color(0xfff9a1bc),
                      labelText: "Password",
                      input: TextInputType.emailAddress,
                      onchanged: (value) {
                        password = value;
                      })),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: CircularButton(
                name: "Login",
                fontSize: 20,
                color: Color(0xfff9a1bc),
                onPressed: () async {
                  var settings = new sql.ConnectionSettings(
                      host: 'remotemysql.com',
                      port: 3306,
                      user: 'Sux7Sc8dpV',
                      password: '5FMS0XeiRk',
                      db: 'Sux7Sc8dpV');
                  var conn = await sql.MySqlConnection.connect(settings);

                  var result = await conn.query(
                      'SELECT Customer_id from Customer where email = "$email" and Password = "$password"');

                  for (var row in result) {
                    custID = await row[0];
                  }

                  conn.close();
                  
                  if (result.length == 1) {
                    
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return CustomerHome(
                        customerid: custID,
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
                    style: TextStyle(color: Color(0xfff9a1bc), fontSize: 14),
                  )),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: InkWell(
                        child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Color(0xfff9a1bc),
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
  TextFields(
      {Key key,
      this.color,
      this.hintText,
      this.icon,
      this.input,
      this.labelText,
      this.onchanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: input,
      onChanged: onchanged,
      decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          labelStyle: TextStyle(color: Color(0xfff9a1bc)),
          icon: icon,
          fillColor: color,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.pinkAccent),
              borderRadius: BorderRadius.circular(35))),
    );
  }
}
