import 'package:book_management/Pages/Homepage.dart';
import 'package:book_management/Pages/Loginsignup.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:boo';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginSignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}