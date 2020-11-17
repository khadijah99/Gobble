import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart' as sql;
import 'package:restaurantchooser/CustomerRegistration.dart';

import 'Buttoons.dart';
import 'ChooseLogin.dart';
import 'ManagerHome.dart';
import 'ManagerLogin.dart';

var listOfFields1 = <Widget>[];
var listOfFields2 = <Widget>[];

List<String> tableNo = [];
List<String> noOfChairs = [];

class DinningTable extends StatefulWidget {
  final int restaurantId;

  const DinningTable({Key key, this.restaurantId}) : super(key: key);
  @override
  _DinningTableState createState() => _DinningTableState(restaurantId);
}

class _DinningTableState extends State<DinningTable> {
  int restaurantId;

  _DinningTableState(this.restaurantId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffc73f65),
        title: Text(
          'Dining Tables',
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              String tableNo1;
              String noOfchairs1;
              setState(() {
                listOfFields1.add(Padding(
                  padding: EdgeInsets.only(top: 5, left: 5, bottom: 5),
                  child: TextFieldss(
                    hintText: "Table No",
                    icon: Icon(Icons.restaurant_menu),
                    color: Color(0xffc73f65),
                    input: TextInputType.number,
                    onchanged: (String a) {
                      tableNo.add(a);
                    },
                  ),
                ));
                listOfFields2.add(Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5, right: 2),
                  child: TextFieldss(
                    hintText: "No of Chairs",
                    icon: Icon(Icons.restaurant),
                    color: Color(0xffc73f65),
                    input: TextInputType.number,
                    onchanged: (String a) {
                      noOfChairs.add(a);
                    },
                  ),
                ));
              });
            },
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 300,
            child: ListView.builder(
                itemCount: listOfFields2.length,
                itemBuilder: (context, index) {
                  var widget1;
                  var widget2;

                  widget1 = listOfFields1[index];
                  widget2 = listOfFields2[index];

                  if (widget1 != null && widget2 != null) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 145,
                          child: widget1,
                        ),
                        Container(
                          height: 50,
                          width: 180,
                          child: widget2,
                        ),
                      ],
                    );
                  }
                }),
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
                int restId = widget.restaurantId;

              

                for (int x = 0; x < listOfFields2.length; x++) {
                  print(tableNo[x]);
                  int diningTable = int.parse(tableNo[x]);
                  int diningChair = int.parse(noOfChairs[x]);

                  await conn.query(
                      'insert into DiningTable values ("$diningTable","$diningChair","$restId")');
                }

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ManagerHome(
                    managerId: restId,
                  );
                }));
              },
              name: "Next",
              fontSize: 20,
              color: Color(0xfff9a1bc),
            ),
          )
        ],
      ),
    );
  }
}
