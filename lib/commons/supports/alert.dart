import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ApAlert{
  static void showWarningToast(String msg, {Toast toastLength = Toast.LENGTH_SHORT}) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        toastLength: toastLength,
        backgroundColor: Colors.amberAccent,
        textColor: Colors.black);
  }

  static void showSuccessToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.lightGreenAccent,
        textColor: Colors.black);
  }
}
