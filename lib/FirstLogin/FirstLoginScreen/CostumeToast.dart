import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CostumeToast {
  static Future<bool?> buildToast(String input, Color txtcol) {
    return Fluttertoast.showToast(
      msg: input,
      toastLength: Toast.LENGTH_LONG,
      fontSize: 20,
      backgroundColor: Colors.white,
      textColor: txtcol,
    );
  }
}
