import 'package:flutter/material.dart';
import 'package:book_management/Other/background.dart';

class Selling extends StatefulWidget {
  @override
  _SellingState createState() => _SellingState();
}

class _SellingState extends State<Selling> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backGround(context),
        Text("hey4"),
      ],
    );
  }
}
