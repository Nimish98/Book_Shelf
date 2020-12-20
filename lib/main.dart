import 'package:book_management/OpeningScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  
  // This widget is the root of your application.
  
  
  void firebaseInit() async{
    await Firebase.initializeApp();
  }
  
  @override
  Widget build(BuildContext context) {
    firebaseInit();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(242, 180, 125, 0.8),
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      home: OpeningScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}