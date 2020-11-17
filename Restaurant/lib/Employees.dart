import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:restaurantchooser/AddEmployee.dart';


class Employees extends StatefulWidget {
  @override
  _Employees createState() => _Employees();
}

class _Employees extends State<Employees> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffc73f65),
        title: Text(
          'Employees',
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
          color: Colors.white, onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return AddEmployee();
                }));
          },),
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            _getBodyWidget(),
            Text("Hello jee testing",
                    style: TextStyle(color: Color(0xffc73f65), fontSize: 25,fontWeight: FontWeight.bold)),
          ],
        ),
      )
       
    );
  }

  Widget _getBodyWidget() {
    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 100,
        rightHandSideColumnWidth: 490,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: 5, //edit this later using count query on employees
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
      ),
      height: MediaQuery.of(context).size.height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Name', 100),
      _getTitleItemWidget('Status', 100),
      _getTitleItemWidget('Designation', 100),
      _getTitleItemWidget('Salary', 50),
      _getTitleItemWidget('Phone', 120),
      _getTitleItemWidget('Join Date', 120),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text('User_$index'), //Add Name attribute here
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Icon(Icons.notifications_active,
                  color: index % 3 == 0 ? Colors.red : Colors.green),
              Text(index % 3 == 0 ? 'On Leave' : 'Active') //Status
            ],
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text('Cook'), //Designation
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text('\$40'), //Salary
          width: 50,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text('+9233158371'), //Contact Info
          width: 120,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
         Container(
          child: Text('23/11/2018'), //JoinDate
          width: 120,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}