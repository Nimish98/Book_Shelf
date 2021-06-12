import 'package:book_management/Pages/Loginsignup.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:book_management/Other/SharedPreferences.dart';

class OpeningScreen extends StatefulWidget {
  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  final pages = [
    PageViewModel(
      pageColor:Color.fromRGBO(242, 180, 120, 0.8),
      bubbleBackgroundColor:  Color(0xFF42210B),
      title:Container(),
      body: Column(
        children: <Widget>[
          Text(
              'Welcome to Book Shelf',
            style: TextStyle(
              fontSize: 30
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'A book management System Application which offers various features in a single application',
            style: TextStyle(
                color: Color(0xFF42210B),
                fontSize: 18.0
            ),
          ),
        ],
      ),
      mainImage: Container(
        child: Image.asset(
          'images/PG3.png',
          width: 285.0,
          alignment: Alignment.bottomCenter,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color:Color(0xFF42210B),
            width: 1.6,
          )
        ),
      ),
      textStyle: TextStyle(
          color: Color(0xFF42210B),
      ),
    ),
    PageViewModel(
      pageColor: Color.fromRGBO(242, 180, 120, 0.8),
      iconColor: null,
      bubbleBackgroundColor:  Color(0xFF42210B),
      title: Container(),
      body: Column(
        children: <Widget>[
          Text(
              'One Touch Exchange/Sell Books hassle free',
            style: TextStyle(
              fontSize: 30
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Exchange & Sell Books online digitally, without going anywhere on our application',
            style: TextStyle(
                color: Color(0xFF42210B),
                fontSize: 18.0
            ),
          ),
        ],
      ),
      mainImage: Container(
        child: Image.asset(
          'images/PG2.png',
          width: 285.0,
          alignment: Alignment.bottomCenter,
        ),
        decoration: BoxDecoration(
            border: Border.all(
              color:Color(0xFF42210B),
              width: 1.6,
            )
        ),
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
          Text(
            'Buy book online',
            style: TextStyle(
                fontSize: 30
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Buy & Read Amazing Collection of various genres books on our application',
            style: TextStyle(
                color:Color(0xFF42210B),
                fontSize: 18.0
            ),
          ),
        ],
      ),
      mainImage: Container(
        child: Image.asset(
          'images/PG4.png',
          width: 285.0,
          alignment: Alignment.bottomCenter,
        ),
        decoration: BoxDecoration(
            border: Border.all(
              color:Color(0xFF42210B),
              width: 1.6,
            ),
        ),
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
                MySharedPreferences.instance.setBooleanValue("firstTimeOpen", true);
                Navigator.pop(context);
                Navigator.push(context,MaterialPageRoute(
                    builder: (context) => LoginSignUp()));
              },
              showSkipButton: true,
              doneText: Text("Get Started",),
              pageButtonsColor:  Color(0xFF42210B),
              pageButtonTextStyles: TextStyle(
                // color: Colors.indigo,
                fontSize: 16.0,
              ),
            ),
            Positioned(
                top: 20.0,
                left: MediaQuery.of(context).size.width/2 - 50,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(
                      "images/Asset.png",
                    ),
                  radius: 50,
                ),
            ),
          ],
        ),
      ),
    );
  }
}