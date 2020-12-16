import 'dart:ui';

import 'package:book_management/Other/background.dart';
import 'package:flutter/material.dart';
import 'package:book_management/Pages/Homepage.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: [
          backGround(context),
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Color(0xFF42210B),
                      size: 30,
                    ),
                    onPressed: (){
                      print("back pressed from detail to home");
                      Navigator.pop(context);
                    },
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Text(
                    "FICTION",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color(0xFF42210B),
                        fontWeight: FontWeight.bold,
                      letterSpacing: 3,
                      decoration: TextDecoration.underline,
                      decorationStyle: TextDecorationStyle.double,
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Align(
                    child: Container(
                      height: 200,
                      width: 145,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1470023092l/31306837._SX318_.jpg",
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12,
                            spreadRadius: 4,
                            offset: Offset(8,8),
                            color:Color(0xFF8C6239),
                          ),
                        ]
                      ),
                    ),
                    alignment: Alignment.topLeft,
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 120,
            left: 180,
            child: Container(
              width: 170,
              child: Text(
                  "Book Name",
                  overflow: TextOverflow.fade,
                  maxLines: 4,
                  style: TextStyle(
                    color: Color(0xFF42210B),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  )
              ),
            ),
          ),
          Positioned(
            top: 210,
            left: 180,
            child: Container(
              width: 170,
              child: Text(
                  "Author Name",
                  maxLines: 3,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    color: Color(0xFF8C6239),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
              ),
            ),
          ),
          Positioned(
            top:270,
            left: 180,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "3.4",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF42210B),
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Icon(
                  Icons.star_border,
                  size: 22,
                  color: Color(0xFF42210B),
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "25687"+" Pages",
                  style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF8C6239),
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 325,
            left: 15,
            child: Text(
              "INTRODUCTION:",
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF42210B),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                letterSpacing: 2
              ),
            ),
          ),
          Positioned(
            top: 355,
            child: ClipRect(
              child: Container(
                height: MediaQuery.of(context).size.height/2-40,
                width: MediaQuery.of(context).size.width,
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaY: 8,
                    sigmaX: 8,
                  ),
                  child: Container(
                    padding: EdgeInsets.only(left: 10,right: 5),
                    height: (MediaQuery.of(context).size.height/2)-40,
                    width: (MediaQuery.of(context).size.width)-20,
                    child: Text(
                        "Physics is one of the oldest academic disciplines and, through its inclusion of astronomy, perhaps the oldest.Over much of the past two millennia, physics, chemistry, biology, and certain branches of mathematics were a part of natural philosophy, but during the Scientific Revolution in the 17th century these natural sciences emerged as unique research endeavors in their own right.Physics intersects with many interdisciplinary areas of research, such as biophysics and quantum chemistry, and the boundaries of physics are not rigidly defined.New ideas in physics often explain the fundamental mechanisms studied by other sciences and suggest new avenues of research in academic disciplines such as mathematics.",
                        maxLines: 15,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          height: 1.4,
                          color: Color(0xFF8C6239),
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        )
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 310,
            left:260,
            child: Container(
              height: 40,
                width: 80,
                child: Center(
                  child: RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text:" \u20B9",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color:Color.fromRGBO(251, 176, 59, 1),
                            ),
                          ),
                          TextSpan(
                            text: " Price"
                                .toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(251, 176, 59, 1),
                            ),
                          ),
                        ]
                    ),
                  ),
                ),
              decoration: BoxDecoration(
                  color: Color(0xFF8C6239),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                    )
                ),
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
                onPressed: (){
                  print("Buy Now");
                },
              elevation: 10,
                child: Text(
                  "BUY NOW",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(251, 176, 59, 1),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3
                  ),
                ),
              color: Color(0xFF8C6239),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
            ),
          ),
        ],
      ),
    );
  }
}
