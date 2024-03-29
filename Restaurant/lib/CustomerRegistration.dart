import 'package:flutter/material.dart';
import 'package:restaurantchooser/CustomerLogin.dart';
import 'package:flutter_date_picker/flutter_date_picker.dart';
import 'package:flutter_date_picker/flutter_time_picker.dart';
import 'package:restaurantchooser/time_date.dart';

import 'Buttoons.dart';

class CustomerRegistration extends StatefulWidget {
  @override
  _CustomerRegistrationState createState() => _CustomerRegistrationState();
}

class _CustomerRegistrationState extends State<CustomerRegistration> {
  String date = DateMonthYear(DateTime.now());
  Future<DateTime> _selectedDateTime(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime(1999),
      firstDate: DateTime(1940),
      lastDate: DateTime.now());

  List<String> _locations = [
    'Please choose a city',
    'Islamabad',
    'Lahore',
    'Karachi',
    'Peshawar'
  ]; // Option 1 List for options e.g cities
  String _selectedLocation =
      'Please choose a city'; // Option 1 the slected option get?  get?

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff9a1bc),
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
              "assets/logo_transparent.png",
              height: 150,
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                hintText: "First Name",
                icon: Icon(Icons.person, color: Color(0xfff9a1bc)),
                color: Color(0xfff9a1bc),
                labelText: "First Name",
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                hintText: "Last Name",
                icon: Icon(Icons.person, color: Color(0xfff9a1bc)),
                color: Color(0xfff9a1bc),
                labelText: "Last Name",
                input: TextInputType.emailAddress,
                
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                hintText: "Username",
                icon: Icon(Icons.assignment_ind, color: Color(0xfff9a1bc)),
                color: Color(0xfff9a1bc),
                labelText: "Username",
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                hintText: "Password",
                icon: Icon(Icons.lock, color: Color(0xfff9a1bc)),
                color: Color(0xfff9a1bc),
                labelText: "Password",
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                hintText: "Email",
                icon: Icon(Icons.alternate_email, color: Color(0xfff9a1bc)),
                color: Color(0xfff9a1bc),
                labelText: "Email",
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                hintText: "IBAN",
                icon: Icon(Icons.account_balance, color: Color(0xfff9a1bc)),
                color: Color(0xfff9a1bc),
                labelText: "IBAN",
                input: TextInputType.emailAddress
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                hintText: "Contact Number",
                icon: Icon(Icons.contact_phone, color: Color(0xfff9a1bc)),
                color: Color(0xfff9a1bc),
                labelText: "Contact Number",
                input: TextInputType.number,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, top: 15, bottom: 0),
              child: Text("Address",
                  style: TextStyle(color: Color(0xfff9a1bc), fontSize: 18)),
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
                        child: TextFieldss(
                          hintText: "House#",
                          icon: Icon(Icons.home, color: Color(0xfff9a1bc)),
                          color: Color(0xfff9a1bc),
                          input: TextInputType.number,
                        )),
                    Container(
                      height: 40,
                      width: 130,
                      child: TextFieldss(
                        hintText: "Street#",
                        icon:
                            Icon(Icons.nature_people, color: Color(0xfff9a1bc)),
                        color: Color(0xfff9a1bc),
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
                    items: _locations.map((location) {
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
              padding: EdgeInsets.only(left: 25, top: 15, bottom: 5),
              child: Text("Date of Birth",
                  style: TextStyle(color: Color(0xfff9a1bc), fontSize: 18)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: GestureDetector(
                onTap: () async {
                  final selectedDate = await _selectedDateTime(context);

                  setState(() {
                    date = DateMonthYear(selectedDate);
                  });
                },
                child: Container(
                  height: 30,
                  width: 10,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.grey)),
                  child: Center(
                    child: Row(
                        children: <Widget>[
                          Text("                            ", style: TextStyle(color: Color(0xfff9a1bc)),),
                          Text(date, style: TextStyle(color: Color(0xfff9a1bc), fontSize: 16)),
                        ]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: CircularButton(
                name: "Register",
                fontSize: 20,
                color: Color(0xfff9a1bc),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldss extends StatelessWidget {
  String hintText;
  Icon icon;
  Color color;
  Function onchanged;
  TextInputType input;
  Function oneEdit;
  TextFieldss({
    Key key,
    this.color,
    this.onchanged,
    this.oneEdit,
    this.hintText,
    this.icon,
    this.input,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      onEditingComplete: oneEdit ,
      onChanged: onchanged,
      keyboardType: input,
      decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: icon,
          labelStyle: TextStyle(color: color),
          //icon: icon,
          fillColor: color,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(35),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pinkAccent),
            borderRadius: BorderRadius.circular(35),
          )),
    );
  }
}
