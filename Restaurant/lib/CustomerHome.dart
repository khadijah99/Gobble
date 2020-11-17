import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mysql1/mysql1.dart' as sql;
import 'TextStyle.dart';

class CustomerHome extends StatefulWidget {
  CustomerHome({this.customerid});
  final int customerid;
  @override
  _CustomerHomeState createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  // Future<List<HotelReviews>> getReviews() async {
  //   var settings = new sql.ConnectionSettings(
  //       host: 'remotemysql.com',
  //       port: 3306,
  //       user: 'Sux7Sc8dpV',
  //       password: '5FMS0XeiRk',
  //       db: 'Sux7Sc8dpV');
  //   var conn = await sql.MySqlConnection.connect(settings);

  //   var result1 = await conn.query(
  //       'select Restaurant.Name,Address.Plot_No,Address.Street_No,City.Name,Restaurant.Reservation,Restaurant.Online_Order,Restaurant.IBAN,Restaurant.Restaurant_id from Restaurant,City,Address where Restaurant.RestaurantManager_Manager_id = "$managerId" and Restaurant.Address_Address_id = Address.Address_id and Address.City_idCity = City.idCity');
  //    List<HotelReviews> hotels = [];

  //   // for (var row in result1) {
  //   //   resName = row[0];
  //   //   plot = row[1];
  //   //   street = row[2];
  //   //   city = row[3];
  //   //   reservation = row[4];
  //   //   online = row[5];
  //   //   iban = row[6];
  //   //   resId = row[7];
  //   // }

  

  //   var result = await conn.query(
  //       'select Reviews.Review,Reviews.Rating,Customer.First_Name from Reviews,Customer where Reviews.Customer_Customer_id = Customer.Customer_id and Reviews.Restaurant_Restaurant_id  = "$resId"');

  //   // List<HotelReviews> hotels = [];

  //   for (var row in result) {
  //     HotelReviews hotel = HotelReviews(
  //       reviews: row[0], customer: row[2], rating: row[1].toInt(),

  //       // name: row[0],
  //     );

  //     hotels.add(hotel);
  //   }

  //   return hotels;
  // }

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // if(index==2){
      //             Navigator.push(context, MaterialPageRoute(builder: (context) {
      //               return EditRestaurant();
      //             }));

      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xfff9a1bc),
        title: Text(
          'Home',
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
        // actions: <Widget>[
        //   IconButton(
        //   icon: Icon(Icons.add),
        //   color: Colors.white, onPressed: () {},),
        // ],
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            decoration:
                InputDecoration(icon: Icon(Icons.search), hintText: "Search"),
          ),
          RestaurantCard(
            reservations: "Yes",
            onlineOrder: "Yes",
            name: "MacDonalds",
            address: "Blue Area, G-5/1",
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.history),
            title: Text('Order History'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xffc73f65),
        onTap: _onItemTapped,
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  String name;
  String onlineOrder;
  String reservations;
  String address;
  RestaurantCard({
    this.name,
    this.onlineOrder,
    this.reservations,
    this.address,
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: t2,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Text(
                "Address: " + address,
                style: t1,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    "Reservation: " + reservations,
                    style: t1,
                  ),
                  Text(
                    "Online Order: " + onlineOrder,
                    style: t1,
                  ),
                ],
              ),
            )
          ],
        ),
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