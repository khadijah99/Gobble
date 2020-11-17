import 'package:flutter/material.dart';
import 'package:restaurantchooser/AddFoodItem.dart';
import 'package:restaurantchooser/CustomerHome.dart';
import 'package:mysql1/mysql1.dart' as sql;
import 'TextStyle.dart';

class FoodItems extends StatefulWidget {
  final int restaurantId;

  const FoodItems({Key key, this.restaurantId}) : super(key: key);
  @override
  _FoodItemsState createState() => _FoodItemsState(restaurantId);
}

class _FoodItemsState extends State<FoodItems> {
  int foodId;

  Future<List<Foods>> getHotels() async {
    var settings = new sql.ConnectionSettings(
        host: 'remotemysql.com',
        port: 3306,
        user: 'Sux7Sc8dpV',
        password: '5FMS0XeiRk',
        db: 'Sux7Sc8dpV');
    var conn = await sql.MySqlConnection.connect(settings);

    var result = await conn.query(
        'select DISTINCT FoodItem.Food_Name,FoodItemCategory.Name,Menu.Price from FoodItem,FoodItemCategory,FoodItem_has_Ingredients,Menu where FoodItem.FoodItemCategory_Category_id = FoodItemCategory.Category_id and FoodItem.FoodItem_id = FoodItem_has_Ingredients.FoodItem_FoodItem_id and Menu.FoodItem_FoodItem_id = FoodItem.FoodItem_id and Menu.Restaurant_Restaurant_id = "$restaurantId"');
    print(result.length);
    var result2 = await conn.query(
        'select DISTINCT FoodItem.FoodItem_id,FoodItem.Food_Name,FoodItemCategory.Name,Menu.Price from FoodItem,FoodItemCategory,FoodItem_has_Ingredients,Menu where FoodItem.FoodItemCategory_Category_id = FoodItemCategory.Category_id and FoodItem.FoodItem_id = FoodItem_has_Ingredients.FoodItem_FoodItem_id and Menu.FoodItem_FoodItem_id = FoodItem.FoodItem_id and Menu.Restaurant_Restaurant_id = "$restaurantId"');

    for (var row in result2) {
      foodId = await row[0];
    }

    var ingre = await conn.query(
        'SELECT Ingredients.Name from Ingredients, FoodItem_has_Ingredients, FoodItem where FoodItem.FoodItem_id = FoodItem_has_Ingredients.FoodItem_FoodItem_id and FoodItem_has_Ingredients.Ingredients_Ingredient_id = Ingredients.Ingredient_id and FoodItem.FoodItem_id = "$foodId"');

    String gugu = '';

    for (var row in ingre) {
      gugu += await row[0] + ',';
    }

    List<Foods> hotels = [];

    for (var row in result) {
      Foods hotel =
          Foods(name: row[0], catergory: row[1], price: row[2], ingred: gugu);

      hotels.add(hotel);
    }
   
    return hotels;
  }

  int restaurantId;

  _FoodItemsState(this.restaurantId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xffc73f65),
          title: Text(
            'FoodItems',
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
              color: Colors.white,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  print("object");
                  print(widget.restaurantId);
                  return AddFoodItem(
                    restaurantId: widget.restaurantId,
                  );
                }));
              },
            ),
          ],
        ),
        body: FutureBuilder(
            future: getHotels(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              // print(snapshot.data);
              if (snapshot.data == null) {
                return Container(child: Center(child: Text("data loading")));
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return FoodItemCard(
                        name: snapshot.data[index].name,
                        category: snapshot.data[index].catergory,
                        ingredients: snapshot.data[index].ingred,
                        price: snapshot.data[index].price,
                        buttonText: "delete",
                        onPressed: () async {
                          var settings = new sql.ConnectionSettings(
                              host: 'remotemysql.com',
                              port: 3306,
                              user: 'Sux7Sc8dpV',
                              password: '5FMS0XeiRk',
                              db: 'Sux7Sc8dpV');
                          var conn =
                              await sql.MySqlConnection.connect(settings);

                          await conn.query(
                              'delete from FoodItem where FoodItem_id = "$foodId"');
                          await conn.query(
                              'delete from FoodItem_has_Ingredients where FoodItem_FoodItem_id = "$foodId"');
                          await conn.query(
                              'delete from Menu where FoodItem_FoodItem_id =  "$foodId"');

                          
                          Navigator.pop(context);
                        },
                      );
                    });
              }
            }));
  }
}

class FoodItemCard extends StatelessWidget {
  String name;
  String category;
  double price;
  String ingredients;
  String buttonText;
  Function onPressed;
  FoodItemCard({
    this.name,
    this.category,
    this.price,
    this.ingredients,
    this.buttonText,
    this.onPressed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  name,
                  style: t1,
                ),
                MaterialButton(
                  child: Text(
                    buttonText,
                    style: t1,
                  ),
                  color: Color(0xffc73f65),
                  hoverColor: Color(0xffc73f65),
                  onPressed: onPressed,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  category,
                  style: t1,
                ),
                Text(
                  "Price : " + price.toString(),
                  style: t1,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                "Ingredients : " + ingredients,
                style: t1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Foods {
  String name;
  String catergory;
  double price;
  String ingred;

  Foods({this.price, this.catergory, this.ingred, this.name});
}
