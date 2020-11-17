import 'package:flutter/material.dart';

import 'Buttoons.dart';
import 'CustomerRegistration.dart';
import 'time_date.dart';

class AddEmployee extends StatefulWidget {
  @override
  _AddEmployeeState createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
   String date = DateMonthYear(DateTime.now());
  Future<DateTime> _selectedDateTime(BuildContext context) => showDatePicker(
      context: context,
      initialDate: DateTime(1999),
      firstDate: DateTime(1940),
      lastDate: DateTime.now());


  bool available = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffc73f65),
        title: Text(
          'Add Employee',
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
        child: ListView(children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 20, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFieldss(
                hintText: "Employee Name",
                icon: Icon(Icons.person, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFieldss(
                hintText: "Designation",
                icon: Icon(Icons.pan_tool, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFieldss(
                hintText: "Salary",
                icon: Icon(Icons.monetization_on, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                input: TextInputType.number,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFieldss(
                hintText: "Contact Number",
                icon: Icon(Icons.phone, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                input: TextInputType.number,
              )),
            ),
             Padding(
              padding: EdgeInsets.only(left: 25, top: 15, bottom: 5),
              child: Text("Join Date",
                  style: TextStyle(color: Color(0xffc73f65), fontSize: 18)),
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
                          Text("                            ", style: TextStyle(color: Color(0xffc73f65)),),
                          Text(date, style: TextStyle(color: Color(0xffc73f65), fontSize: 16)),
                        ]),
                  ),
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
                    value: available,
                    onChanged: (bool value) {
                      setState(() {
                        available = value;
                      });
                    },
                  ),
                  Text("Available"),
                  ],
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: CircularButton(
                name: "Add Another Employee",
                fontSize: 20,
                color: Color(0xffc73f65),
              ),
            ),
             Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: CircularButton(
                name: "Done",
                fontSize: 20,
                color: Color(0xffc73f65),
              ),
            ),
        ],),
      ),
    );
  }
}