import 'package:book_management/Class/Books.dart';
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
        Container(
          padding: EdgeInsets.all(10),
          child: FutureBuilder<List<Books>>(
            future: readFavBooks(widget.userDetails),
            builder: (BuildContext builder,AsyncSnapshot<List<Books>> list){
              if(list.hasData){
                return ListView.builder(
                  itemCount: list.data.length,
                  itemBuilder: (context,i){
                    return Container(
                      color: Colors.orange,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title:  Text(list.data[i].name),
                      ),
                    );
                  }
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
