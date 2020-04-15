import 'package:app_be_the_hero_madeinflutter/scenes/incident/incident_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    pushScreenIncident();
  }

  Future<bool> pushScreenIncident() async {
    await durationScreen();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => IncidentWidget()));
    return true;
  }

  Future<bool> durationScreen() async {
    await Future.delayed(Duration(seconds: 5));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(224, 32, 65, 6),
      body: Container(
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
