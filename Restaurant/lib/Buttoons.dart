import 'package:flutter/material.dart';


class CircularButton extends StatelessWidget {
  @required
  String name;
  double fontSize;
  Color color;
  Function onPressed;
  CircularButton({Key key, this.name, this.fontSize, this.color, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        height: 60,
        width: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: color,
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
            ),
          ),
        ),
      ), onPressed: onPressed, 
    );
  }
}



class CircularButtonSmall extends StatelessWidget {
  @required
  double height;
  double width;
  String name;
  double fontSize;
  Color color;
  Function onPressed;
  CircularButtonSmall({Key key, this.name, this.fontSize, this.color, this.height, this.width, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35),
          color: color,
        ),
        child: Center(
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
            ),
          ),
        ),
      ), onPressed: onPressed
      
      
    );
  }
}
