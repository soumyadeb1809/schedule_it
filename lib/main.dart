import 'package:flutter/material.dart';
import 'package:schedule_it/screens/new_post/new_post_screen.dart';
import 'package:schedule_it/screens/login/login_screen.dart';
import 'package:schedule_it/screens/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Scheduler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: 'SSP',
      ),
      home: LoginScreen(),
    );
  }
}



