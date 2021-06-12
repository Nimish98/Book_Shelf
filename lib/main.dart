import 'package:book_management/OpeningScreen.dart';
import 'package:book_management/Pages/Loginsignup.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:book_management/Other/SharedPreferences.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  
  // This widget is the root of your application.
  
  
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isFirstTimeOpen = false;

  MyAppState() {
    MySharedPreferences.instance
        .getBooleanValue("firstTimeOpen")
        .then((value) => setState(() {
      isFirstTimeOpen = value;
    }));}

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
      home: isFirstTimeOpen?LoginSignUp():OpeningScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}