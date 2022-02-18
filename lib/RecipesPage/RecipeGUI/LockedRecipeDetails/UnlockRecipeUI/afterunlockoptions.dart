import 'package:flutter/material.dart';

class Afterunlockoption extends StatelessWidget {
  String input;
  Afterunlockoption(this.input);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.task_alt_rounded,
          size: 30,
        ),
        Text(
          input,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
