import 'package:flutter/material.dart';
import 'package:flutter_star_rating/flutter_star_rating.dart';
import 'package:restaurantchooser/EditManagerProfile.dart';
import 'package:restaurantchooser/EditRestaurant.dart';
import 'package:restaurantchooser/Employees.dart';
import 'package:restaurantchooser/FoodItems.dart';
import 'package:restaurantchooser/ReviewComments.dart';
import 'package:mysql1/mysql1.dart' as sql;
import 'Buttoons.dart';

class ManagerHome extends StatefulWidget {
  final int managerId;
  final double averageRating;

  const ManagerHome({Key key, this.managerId, this.averageRating})
      : super(key: key);
  @override
  _ManagerHomeState createState() => _ManagerHomeState(managerId);
}

class _ManagerHomeState extends State<ManagerHome> {
  Future<List<HotelReviews>> getReviews() async {
    var settings = new sql.ConnectionSettings(
        host: 'remotemysql.com',
        port: 3306,
        user: 'Sux7Sc8dpV',
        password: '5FMS0XeiRk',
        db: 'Sux7Sc8dpV');
    var conn = await sql.MySqlConnection.connect(settings);

    var result1 = await conn.query(
        'select Restaurant.Name,Address.Plot_No,Address.Street_No,City.Name,Restaurant.Reservation,Restaurant.Online_Order,Restaurant.IBAN,Restaurant.Restaurant_id from Restaurant,City,Address where Restaurant.RestaurantManager_Manager_id = "$managerId" and Restaurant.Address_Address_id = Address.Address_id and Address.City_idCity = City.idCity');
    for (var row in result1) {
      resName = row[0];
      plot = row[1];
      street = row[2];
      city = row[3];
      reservation = row[4];
      online = row[5];
      iban = row[6];
      resId = row[7];
    }

    // var av = await conn.query(
    //   'SELECT Restaurant.Restaurant_id, AVG(Rating) from Restaurant, Reviews, RestaurantManager where RestaurantManager.Manager_id = Restaurant.RestaurantManager_Manager_id and Restaurant.Restaurant_id = Reviews.Restaurant_Restaurant_id and Restaurant.RestaurantManager_Manager_id = "$managerId" GROUP by Restaurant_Restaurant_id'
    // );

    // for(var row in av){
    //   average = row[0];
    // }

    var result = await conn.query(
        'select Reviews.Review,Reviews.Rating,Customer.First_Name from Reviews,Customer where Reviews.Customer_Customer_id = Customer.Customer_id and Reviews.Restaurant_Restaurant_id  = "$resId"');

    List<HotelReviews> hotels = [];

    for (var row in result) {
      HotelReviews hotel = HotelReviews(
        reviews: row[0], customer: row[2], rating: row[1].toInt(),

        // name: row[0],
      );

      hotels.add(hotel);
    }

    return hotels;
  }

  String restaurantName = "My Restaurant";

  int _selectedIndex = 0;

  int managerId;

  _ManagerHomeState(this.managerId);

  String resName;
  int plot;
  int street;
  String city;
  int reservation;
  int online;
  String iban;
  int resId;
  int noOfTables;
  String firstName;
  String lastName;
  String userName;
  String email;
  int contactNo;
  double average = 3.5;

  Future<void> _onItemTapped(int index) async {
    var settings = new sql.ConnectionSettings(
        host: 'remotemysql.com',
        port: 3306,
        user: 'Sux7Sc8dpV',
        password: '5FMS0XeiRk',
        db: 'Sux7Sc8dpV');
    var conn = await sql.MySqlConnection.connect(settings);

    var result = await conn.query(
        'select Restaurant.Name,Address.Plot_No,Address.Street_No,City.Name,Restaurant.Reservation,Restaurant.Online_Order,Restaurant.IBAN,Restaurant.Restaurant_id from Restaurant,City,Address where Restaurant.RestaurantManager_Manager_id = "$managerId" and Restaurant.Address_Address_id = Address.Address_id and Address.City_idCity = City.idCity');
    for (var row in result) {
      resName = await row[0];
      plot = row[1];
      street = row[2];
      city = row[3];
      reservation = row[4];
      online = row[5];
      iban = row[6];
      resId = row[7];
    }

    var table = await conn.query(
        'select count(DiningTable.idDiningTable) as NoOfTables from DiningTable where DiningTable.Restaurant_Restaurant_id = "$resId"');

    for (var row in table) {
      noOfTables = await row[0];
    }

    conn.close();
    setState(() {
      _selectedIndex = index;
      if (index == 2) {
        print(resName);

        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditRestaurant(
            bankacc: iban,
            city: city,
            plot: plot,
            restaurantName: resName,
            reservation: reservation,
            street: street,
            noOfTables: noOfTables,
            online: online,
          );
        }));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffc73f65),
        title: Text(
          restaurantName,
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
            icon: Icon(Icons.person),
            color: Colors.white,
            onPressed: () async {
              var settings = new sql.ConnectionSettings(
                  host: 'remotemysql.com',
                  port: 3306,
                  user: 'Sux7Sc8dpV',
                  password: '5FMS0XeiRk',
                  db: 'Sux7Sc8dpV');
              var conn = await sql.MySqlConnection.connect(settings);

              var results = await conn.query(
                  'select First_name,Last_name,Username,email,Contact_No from RestaurantManager ');

              for (var row in results) {
                firstName = await row[0];
                lastName = await row[1];
                userName = await row[2];
                email = await row[3];
                contactNo = await row[4];
              }

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return EditManagerProfile(
                  firstName: firstName,
                  lastName: lastName,
                  contactNo: contactNo,
                  email: email,
                  userName: userName,
                );
              }));
            },
          )
        ],
      ),
      body: Center(
        child: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 0, bottom: 0),
            child: Image.asset(
              "ManagerAssets/logo_transparent.png",
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 15),
            child: StarRating(
              starConfig: StarConfig(
                fillColor: Colors.blue,
                size: 12,
                strokeColor: Colors.red,
                raysCount: 5,
              ),
              rating: widget.averageRating,
            ),
          ),
          CircularButton(
            name: "Employees",
            fontSize: 14,
            color: Color(0xffc73f65),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Employees();
              }));
            },
          ),
          SizedBox(
            height: 20,
          ),
          CircularButton(
            name: "Food Items",
            fontSize: 14,
            color: Color(0xffc73f65),
            onPressed: () async {
              var settings = new sql.ConnectionSettings(
                  host: 'remotemysql.com',
                  port: 3306,
                  user: 'Sux7Sc8dpV',
                  password: '5FMS0XeiRk',
                  db: 'Sux7Sc8dpV');
              var conn = await sql.MySqlConnection.connect(settings);

              var result = await conn.query(
                  'select Restaurant.Name,Address.Plot_No,Address.Street_No,City.Name,Restaurant.Reservation,Restaurant.Online_Order,Restaurant.IBAN,Restaurant.Restaurant_id from Restaurant,City,Address where Restaurant.RestaurantManager_Manager_id = "$managerId" and Restaurant.Address_Address_id = Address.Address_id and Address.City_idCity = City.idCity');
              for (var row in result) {
                resName = row[0];
                plot = row[1];
                street = row[2];
                city = row[3];
                reservation = row[4];
                online = row[5];
                iban = row[6];
                resId = row[7];
              }

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                print("Manager");
                print(resId);
                return FoodItems(
                  restaurantId: resId,
                );
              }));
            },
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 60, bottom: 0),
              child: Text("Reviews",
                  style: TextStyle(
                      color: Color(0xffc73f65),
                      fontSize: 25,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          FutureBuilder(
              future: getReviews(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                // print(snapshot.data);
                if (snapshot.data == null) {
                  return Container(child: Center(child: Text("Loading")));
                } else {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ReviewComments(
                            comment: snapshot.data[index].reviews,
                            ratings: snapshot.data[index].rating.toInt(),
                            customerName: snapshot.data[index].customer,
                          );
                        }),
                  );
                }
              }),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance),
            title: Text('Revenue'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            title: Text('Restaurant'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xffc73f65),
        onTap: _onItemTapped,
      ),
    );
  }
}

class HotelReviews {
  String reviews;
  String customer;
  int rating;

  HotelReviews({this.customer, this.rating, this.reviews});
}
