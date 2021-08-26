import 'package:flutter/material.dart';

class NotificationsService {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();

  static showSnackBarError(String message) {
    final snackBar = new SnackBar(
      backgroundColor: Colors.red.withOpacity(0.9),
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
