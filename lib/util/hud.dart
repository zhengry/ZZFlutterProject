import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HUD{
  static showMessage(String message){
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.lightGreen,
      textColor: Colors.white,
    );
  }
}