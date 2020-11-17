import 'package:flutter/material.dart';
import 'package:restaurantchooser/Cart.dart';
import 'package:restaurantchooser/ChooseLogin.dart';
import 'package:restaurantchooser/CustomerHome.dart';
import 'package:restaurantchooser/EditCustomerInfo.dart';
import 'package:restaurantchooser/EditManagerProfile.dart';
import 'package:restaurantchooser/ManagerRegistration.dart';
import 'package:restaurantchooser/SelectedRestaurantScreen.dart';

import 'ManagerLogin.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:ChooseLogin()
    );
  }
}

