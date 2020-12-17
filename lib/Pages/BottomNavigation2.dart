import 'package:flutter/material.dart';
import 'package:book_management/Other/background.dart';

class Favourites extends StatefulWidget {
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backGround(context),
        Text("hey2"),
      ],
    );
  }
}
