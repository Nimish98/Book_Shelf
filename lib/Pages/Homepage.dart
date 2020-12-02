import 'package:flutter/material.dart';
import 'package:book_management/Other/background.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
   return HomePageState();
  }
}
class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            backGround(context),

          ],
        )
      ),
    );
  }
}






