import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Buttoons.dart';
import 'CustomerRegistration.dart';

import 'package:mysql1/mysql1.dart' as sql;

class AddFoodItem extends StatefulWidget {
  final int restaurantId;

  const AddFoodItem({Key key, this.restaurantId}) : super(key: key);
  @override
  _AddFoodItemState createState() => _AddFoodItemState(restaurantId);
}

class _AddFoodItemState extends State<AddFoodItem> {
  int categoryId;
  String foodName;
  int foodId;
  String ingredients;
  double price;

  List<String> _categories = [
    'Select a Category',
    'Appetizer',
    'Main Dish',
    'Seafood',
    'Dessert',
    'Beverage',
    'Salad',
    'Sandwich',
    'Pizza'
  ]; // Option 1 List for options e.g cities
  String _selectedCategory = 'Select a Category';

  int restaurantId;

  _AddFoodItemState(this.restaurantId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffc73f65),
        title: Text(
          'Add Food Item',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () async {
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
                  child: new TextFieldss(
                onchanged: (String a) {
                  foodName = a;
                },
                hintText: "Item Name",
                icon: Icon(Icons.fastfood, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                input: TextInputType.emailAddress,
              )),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 10, bottom: 10, left: 44, right: 44),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(35),
                    border: Border.all(color: Colors.grey)),
                child: Center(
                  child: DropdownButton(
                    value: _selectedCategory,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedCategory =
                            newValue; //setting new value, newValue is the one we get from the user and putting that equal to the one we declared at top
                      });
                    },
                    items: _categories.map((category) {
                      //Passing the list we crated of cities to a dropdwon menu and it has child with location that is at top
                      return DropdownMenuItem(
                        child: new Text(category),
                        value: category,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFieldss(
                onchanged: (String a) {
                  price = double.parse(a);
                },
                hintText: "Price",
                icon: Icon(Icons.monetization_on, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                input: TextInputType.number,
              )),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, left: 25, right: 25),
              child: Center(
                  child: new TextFieldss(
                onchanged: (String a) {
                  ingredients = a;
                },
                hintText: "Ingredients",
                icon:
                    Icon(FontAwesomeIcons.pizzaSlice, color: Color(0xffc73f65)),
                color: Color(0xffc73f65),
                input: TextInputType.emailAddress,
              )),
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

                  var result = await conn.query(
                      'select Category_id from FoodItemCategory where Name = "$_selectedCategory"');

                  for (var row in result) {
                    categoryId = await row[0];
                  }

                  await conn.query(
                      'insert into FoodItem values (null,"$categoryId", "$foodName")');

                  List<String> ingred = ingredients.split(',');

                  for (int x = 0; x < ingred.length; x++) {
                    String inn = ingred[x];
                    var result = await conn.query(
                        'select Name from Ingredients where Name = "$inn"');
                    if (result.length == 0) {
                      await conn.query(
                          'insert into Ingredients values (null, "$inn")');
                      var res = await conn.query(
                          'select ingredient_id from Ingredients where Name = "$inn"');

                      var rep = await conn.query(
                          'select FoodItem_id from FoodItem where Food_Name = "$foodName" ');

                      for (var row in rep) {
                        foodId = await row[0];
                      }

                      for (var row in res) {
                        int ids = row[0];
                        await conn.query(
                            'insert into FoodItem_has_Ingredients values ("$foodId", "$ids")');
                      }
                      int id = widget.restaurantId;
                      await conn.query(
                          'insert into Menu values ("$id", "$foodId", "$price")');
                    }
                  }

                  conn.close();

                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddFoodItem(
                      restaurantId: widget.restaurantId,
                    );
                  }));
                },
                name: "Add Another Item",
                fontSize: 20,
                color: Color(0xffc73f65),
              ),
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

                  var result = await conn.query(
                      'select Category_id from FoodItemCategory where Name = "$_selectedCategory"');

                  for (var row in result) {
                    categoryId = await row[0];
                  }

                  await conn.query(
                      'insert into FoodItem values (null,"$categoryId", "$foodName")');

                  List<String> ingred = ingredients.split(',');

                  for (int x = 0; x < ingred.length; x++) {
                    String inn = ingred[x];
                    var result = await conn.query(
                        'select Name from Ingredients where Name = "$inn"');
                    if (result.length == 0) {
                      await conn.query(
                          'insert into Ingredients values (null, "$inn")');
                      var res = await conn.query(
                          'select ingredient_id from Ingredients where Name = "$inn"');

                      var rep = await conn.query(
                          'select FoodItem_id from FoodItem where Food_Name = "$foodName" ');

                      for (var row in rep) {
                        foodId = await row[0];
                      }

                      for (var row in res) {
                        int ids = row[0];
                        await conn.query(
                            'insert into FoodItem_has_Ingredients values ("$foodId", "$ids")');
                      }
                      int id = widget.restaurantId;
                      await conn.query(
                          'insert into Menu values ("$id", "$foodId", "$price")');
                    }
                  }

                  conn.close();

                  Navigator.pop(context);
                },
                name: "Done",
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
