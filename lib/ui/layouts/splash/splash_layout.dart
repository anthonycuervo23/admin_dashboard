import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashLayout extends StatelessWidget {
  const SplashLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(
              animating: true,
              radius: 45,
            ),
            SizedBox(
              height: 20.0,
            ),
            Text('Checking...'),
          ],
        ),
      ),
    );
  }
}
