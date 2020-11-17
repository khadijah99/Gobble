import 'package:flutter/material.dart';

class TextFieldDisabled extends StatelessWidget {
  String hintText;
  Icon icon;
  Color color;
  String labelText;
  TextInputType input;
   TextFieldDisabled({
    Key key,this.color,this.hintText,this.icon, this.input, this.labelText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: input,
      focusNode: new AlwaysDisabledFocusNode(),

      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Color(0xffc73f65)),
        icon: icon,
        fillColor: color,
        
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(35),
          

        )
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}