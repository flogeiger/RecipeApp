import 'package:flutter/material.dart';

class UnlockRecipeButton extends StatelessWidget {
  String input;
  UnlockRecipeButton(this.input);
  @override
  Widget build(BuildContext context) {
    return input == '4,49 € / Monat'
        ? Container(
            child: Center(
              child: Text(
                input.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
            ),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
          )
        : Container(
            child: Center(
              child: Text(
                input.toUpperCase(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
            ),
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width,
          );
  }
}
