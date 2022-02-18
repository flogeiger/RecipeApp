import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  Color buttonBackgroundCol;
  String buttonString;
  double paddingleft;
  double paddingright;
  Color txtColor;
  Color borderCol;
  FilterButton(
    this.buttonString,
    this.buttonBackgroundCol,
    this.paddingleft,
    this.paddingright,
    this.txtColor,
    this.borderCol,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), //color of shadow
            spreadRadius: 3, //spread radius
            blurRadius: 5,
            offset: Offset(3, 3),
          ),
        ],
        color: buttonBackgroundCol,
        border: Border.all(width: 2, color: borderCol),
      ),
      child: Container(
        child: Center(
          child: Text(
            buttonString,
            style: TextStyle(
              color: txtColor,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
