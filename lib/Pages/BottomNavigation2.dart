import 'package:book_management/Class/UserDetails.dart';
import 'package:book_management/Other/CRUD.dart';
import 'package:flutter/material.dart';
import 'package:book_management/Other/background.dart';

class Favourites extends StatefulWidget {
  final UserDetails userDetails;

  const Favourites({Key key, this.userDetails}) : super(key: key);
  
  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  @override
  void initState() {
    super.initState();
    readFavBooks(widget.userDetails);
  }
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backGround(context),
        Center(child: Text("hey2")),
      ],
    );
  }
}
