import 'package:flutter/material.dart';

class CostumeOptionPoint extends StatelessWidget {
  CostumeOptionPoint(
    this._optionPointIcon,
    this._optionPointName,
    this._optionPointcolor,
  );
  IconData _optionPointIcon;
  String _optionPointName;
  Color _optionPointcolor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: this._optionPointcolor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              this._optionPointIcon,
              color: Colors.black,
              size: 45,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(this._optionPointName), //ranking für das erste
          SizedBox(
            height: 10,
            width: 50,
            child: Divider(
              thickness: 2.5,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}
