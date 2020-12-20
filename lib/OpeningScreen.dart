import 'package:book_management/Pages/Loginsignup.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class OpeningScreen extends StatelessWidget {
  // static final String path = "lib/src/pages/onboarding/smart_wallet_onboarding.dart";
  final pages = [
    PageViewModel(
      pageColor:Color.fromRGBO(242, 180, 120, 0.8),
      bubbleBackgroundColor:  Color(0xFF42210B),
      title: Container(),
      body: Column(
        children: <Widget>[
          // Text('Welcome to Smart Wallet'),
          Text(
            'k',
            style: TextStyle(
                color: Color(0xFF42210B),
                fontSize: 16.0
            ),
          ),
        ],
      ),
      mainImage: Image.asset(
        'images/PG2.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Color(0xFF42210B)),
    ),
    PageViewModel(
      pageColor: Color.fromRGBO(242, 180, 120, 0.8),
      iconColor: null,
      bubbleBackgroundColor:  Color(0xFF42210B),
      title: Container(),
      body: Column(
        children: <Widget>[
          // Text('One Touch Send Money'),
          Text(
            'l',
            style: TextStyle(
                color: Color(0xFF42210B),
                fontSize: 16.0
            ),
          ),
        ],
      ),
      mainImage: Image.asset(
        'images/PG3.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Color(0xFF42210B)),
    ),
    PageViewModel(
      pageColor: Color.fromRGBO(242, 180, 120, 0.8),
      iconColor: null,
      bubbleBackgroundColor:  Color(0xFF42210B),
      title: Container(),
      body: Column(
        children: <Widget>[
          // Text('Automatically Organize'),
          Text(
            'p',
            style: TextStyle(
                color:Color(0xFF42210B),
                fontSize: 16.0
            ),
          ),
        ],
      ),
      mainImage: Image.asset(
        'images/PG4.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Color(0xFF42210B)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            IntroViewsFlutter(
              pages,
              onTapDoneButton: (){
                Navigator.push(context,MaterialPageRoute(
                    builder: (context) => LoginSignUp()));
              },
              showSkipButton: false,
              doneText: Text("Get Started",),
              pageButtonsColor:  Color(0xFF42210B),
              pageButtonTextStyles: TextStyle(
                // color: Colors.indigo,
                fontSize: 16.0,
                fontFamily: "Regular",
              ),
            ),
            Positioned(
                top: 20.0,
                left: MediaQuery.of(context).size.width/2 - 50,
                child: Image.asset('images/Applogo.png', width: 100,)
            ),
          ],
        ),
      ),
    );
  }
}