import 'dart:ui';
import 'package:book_management/Class/Books.dart';
import 'package:book_management/Class/UserDetails.dart';
import 'package:book_management/Other/CRUD.dart';
import 'package:book_management/Pages/DetailsPage.dart';
import 'package:flutter/cupertino.dart';
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
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 0,
                    crossAxisCount: 2,
                    childAspectRatio: 0.70
                  ),
                    itemCount: list.data.length,
                    itemBuilder: (context,i){
                      return GestureDetector(
                        child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            Container(
                              height: 380,
                              width: 230,
                              padding: EdgeInsets.only(left:10,right: 10,bottom: 10),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(241, 204, 113, 1),
                                borderRadius: BorderRadius
                                    .circular(35),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                      list.data[i].name,
                                      maxLines: 4,
                                      style: TextStyle(
                                        color: Color(0xFF42210B),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                      )
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 380,
                              width: 230,
                              decoration: BoxDecoration(
                                image:  DecorationImage(
                                  image:  AssetImage(
                                      "images/Asset1.png"
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                // color: Colors.amberAccent,
                                borderRadius: BorderRadius
                                    .circular(35),
                              ),
                            ),
                            Positioned(
                              bottom: 175,
                              left: 100,
                              child: Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(
                                    color: Color(0xFF8C6239),
                                    borderRadius: BorderRadius.all(Radius.circular(24)),
                                    border: Border.all(
                                      width: 1.2,
                                      color: Color.fromRGBO(251, 176, 59, 1),
                                    )
                                ),
                                child: Center(
                                  child: RichText(
                                    text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:" \u20B9",
                                            style: TextStyle(
                                              fontSize: 16.5,
                                              fontWeight: FontWeight.w600,
                                              color: Color.fromRGBO(251, 176, 59, 1),
                                            ),
                                          ),
                                          TextSpan(
                                            text: "${list.data[i].price}"
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Color.fromRGBO(251, 176, 59, 1),
                                            ),
                                          ),
                                        ]
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom:0,
                              left: 0,
                              right: 0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius
                                      .circular(35),
                                  bottomRight: Radius
                                      .circular(35),
                                ),
                                child: Container(
                                  width: 230,
                                  height: 60,
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX:10,
                                      sigmaY:8,
                                    ),
                                    child: Padding(
                                      padding:  EdgeInsets.only(left:10.0,right: 2),
                                      child: Container(
                                        width: 230,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                "INTRODUCTION:",
                                                style: TextStyle(
                                                    color: Color(0xFF42210B),
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w700,
                                                    decoration: TextDecoration.underline,
                                                    letterSpacing: 1.5
                                                )
                                            ),
                                            Text(
                                               list.data[i].intro,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                                style: TextStyle(
                                                  height: 1.4,
                                                  color: Color(0xFF8C6239),
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w800,
                                                )
                                            ),
                                          ],

                                        ),
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius
                                        .only(
                                      bottomLeft: Radius
                                          .circular(35),
                                      bottomRight: Radius
                                          .circular(35),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top:15,
                              left: 15,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    list.data[i].rating.toString(),
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF42210B),
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    size: 18,
                                    color: Color(0xFF42210B),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage(
                            books: list.data[i],
                            userDetails: widget.userDetails,
                          )));
                        },
                      );
                    }
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8C6239)),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
// ListView.builder(
// itemCount: list.data.length,
// itemBuilder: (context,i){
// return Container(
// color: Colors.orange,
// padding: EdgeInsets.all(10),
// margin: EdgeInsets.symmetric(vertical: 10),
// child: ListTile(
// title:  Text(list.data[i].name),
// ),
// );
// }
// );