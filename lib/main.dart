import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Scheduler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF6C63FF, color),
        fontFamily: 'SSP'
      ),
      home: LoginScreen(),
    );
  }
}

Map<int, Color> color = {
  50:Color.fromRGBO(108,99,255, .1),
  100:Color.fromRGBO(108,99,255, .2),
  200:Color.fromRGBO(108,99,255, .3),
  300:Color.fromRGBO(108,99,255, .4),
  400:Color.fromRGBO(108,99,255, .5),
  500:Color.fromRGBO(108,99,255, .6),
  600:Color.fromRGBO(108,99,255, .7),
  700:Color.fromRGBO(108,99,255, .8),
  800:Color.fromRGBO(108,99,255, .9),
  900:Color.fromRGBO(108,99,255, 1),
};



