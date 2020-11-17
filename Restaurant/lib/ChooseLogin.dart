import 'package:flutter/material.dart';
import 'package:restaurantchooser/CustomerLogin.dart';
import 'package:restaurantchooser/ManagerLogin.dart';

import 'Buttoons.dart';

class ChooseLogin extends StatefulWidget {
  @override
  _ChooseLoginState createState() => _ChooseLoginState();
}

class _ChooseLoginState extends State<ChooseLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/logo_transparent.png",
            ),
            CircularButton(
              name: "Login as Customer",
              fontSize: 14,
              color: Color(0xfff9a1bc),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return CustomerLogin();
                }));
              },
            ),
            SizedBox(
              height: 20,
            ),
            CircularButton(
              name: "Login as Manager",
              fontSize: 14,
              color: Color(0xffc73f65),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ManagerLogin();
                }));
              },
            )
          ],
        ),
      ),
    );
  }
}
