import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(224,32,65, 6),
      body:  Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('lib/assets/images/splash.png'),
              fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
