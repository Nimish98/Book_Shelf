import 'package:book_management/Pages/Loginsignup.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  
  
  void firebaseInit() async{
    print("here");
    await Firebase.initializeApp();
  }
  
  @override
  Widget build(BuildContext context) {
    firebaseInit();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(242, 180, 120, 1),
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      home: LoginSignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}