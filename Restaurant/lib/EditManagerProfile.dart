import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:restaurantchooser/CustomerLogin.dart';
import 'Buttoons.dart';

class EditManagerProfile extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final int contactNo;

  EditManagerProfile(
      {Key key,
      this.contactNo,
      this.email,
      this.firstName,
      this.lastName,
      this.userName})
      : super(key: key);
  @override
  _EditManagerProfile createState() =>
      _EditManagerProfile(contactNo, email, firstName, lastName, userName);
}

class _EditManagerProfile extends State<EditManagerProfile> {
  String firstName;
  String lastName;
  String userName;
  String email;
  int contactNo;
  int managerId;

  _EditManagerProfile(
      this.contactNo, this.userName, this.lastName, this.firstName, this.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffc73f65),
        title: Text(
          'My Profile',
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
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                onchanged: (String a) {
                  firstName = a;
                },
                hintText: "First Name",
                icon: Icon(Icons.person, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                labelText: widget.firstName,
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
                labelText: widget.lastName,
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                    onchanged: (String a) {
                  userName = a;
                },
                hintText: "Username",
                icon: Icon(Icons.assignment_ind, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                labelText: widget.userName,
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                hintText: "Password",
                icon: Icon(Icons.lock, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                labelText: "******",
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
                labelText: widget.email,
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFields(
                onchanged: (String a) {
                  contactNo = int.parse(a);
                },
                hintText: "Contact No.",
                icon: Icon(Icons.contact_phone, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                labelText: widget.contactNo.toString(),
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
                      print("frfer");
                  var conn = await MySqlConnection.connect(settings);
       print("frfer22222");
                  await conn.query(
                      'update RestaurantManager set First_Name = "$firstName", Last_Name = "$lastName", Username = "$userName", email = "$email", Contact_No = "$contactNo" where email = "${widget.email}"');

                      conn.close();

                  Navigator.pop(context);
                },
                name: "Save Changes",
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
