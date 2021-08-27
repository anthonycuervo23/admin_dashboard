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

  static showSnackBar(String message) {
    final snackBar = new SnackBar(
      backgroundColor: Colors.green.withOpacity(0.9),
      content: Text(
        message,
        style: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
    );

    messengerKey.currentState!.showSnackBar(snackBar);
  }

  static showLoadingIndicator(BuildContext context) {
    final AlertDialog dialog = AlertDialog(
      content: Container(
        width: 100,
        height: 100,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
    return showDialog<Widget>(context: context, builder: (_) => dialog);
  }
}
