import 'package:flutter/material.dart';
import 'package:flutter_star_rating/flutter_star_rating.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class ReviewComments extends StatelessWidget {
  String customerName;
  String comment;
  int ratings;
  Color color;

  ReviewComments({
    this.comment,
    this.ratings,
    this.customerName,
    this.color,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Icon(
              FontAwesomeIcons.userCircle,
              color: Colors.black,
            ),
            Text(
              customerName,
              style: TextStyle(fontSize: 12),
            ),
            StarRating(
              starConfig: StarConfig(
              fillColor : Colors.blue,
              size: 12,
              strokeColor: Colors.red,
              raysCount: 5,
              ),            
              rating: ratings.toDouble(),
            ),
            Text(
              comment,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}