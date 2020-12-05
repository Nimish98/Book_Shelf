import 'package:book_management/Other/List.dart';
import 'package:flutter/material.dart';
import 'package:book_management/Other/background.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:book_management/Other/FirstLayer.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => new _HomePageState();

}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;
  bool isOpen = false;
  bool isPlaying = false;

  bool first = false,
      second = false,
      third = false;
  var firstColour = Colors.transparent,
      secondColour = Colors.transparent,
      thirdColour = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FirstLayer(),
          AnimatedContainer(
            transform: Matrix4Transform()
                .translate(x: xoffSet, y: yoffSet)
                .rotate(angle)
                .matrix4,
            duration: Duration(milliseconds: 200),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  child: Stack(
                    children: [
                      backGround(context),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 19,),
                              !isOpen
                                  ? IconButton(
                                  icon: Icon(
                                    Icons.menu,
                                    color: Color(0xFF42210B),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      xoffSet = 150;
                                      yoffSet = 80;
                                      angle = -0.2;
                                      isOpen = true;
                                    });
                                  })
                                  : IconButton(
                                  icon: Icon(Icons.arrow_back_ios,
                                      color: Color(0xFF42210B)),
                                  onPressed: () {
                                    if (isOpen == true) {
                                      setState(() {
                                        xoffSet = 0;
                                        yoffSet = 0;
                                        angle = 0;
                                        isOpen = false;
                                      });
                                    }
                                  }),
                              SizedBox(width: 250,),
                              Icon(Icons.search,
                                  size: 30, color: Color(0XFF42210B)),
                            ],
                          ),
                          SizedBox(height: 40),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(width: 10,),
                                RaisedButton(
                                    onPressed: () {
                                      print("Button is pressed");
                                      setState(() {
                                        first = !first;
                                        if (first == true) {
                                          firstColour = Color(0xFFFBB03B);
                                          secondColour = Colors.transparent;
                                          thirdColour = Colors.transparent;
                                          second = false;
                                          third = false;
                                        }
                                      });
                                    },
                                    child: new Text("POPULAR",
                                      style: TextStyle(fontSize: 19,
                                          color: Color(0xFF42210B)),),
                                    color: firstColour,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          18.0),)
                                ),
                                SizedBox(width: 10,),
                                RaisedButton(
                                    onPressed: () {
                                      print("Button is pressed");
                                      setState(() {
                                        second = !second;
                                        if (second == true) {
                                          secondColour = Color(0xFFFBB03B);
                                          firstColour = Colors.transparent;
                                          thirdColour = Colors.transparent;
                                          first = false;
                                          third = false;
                                        }
                                      });
                                    },
                                    child: new Text("RECOMMENDED",
                                      style: TextStyle(fontSize: 19,
                                          color: Color(0xFF42210B)),),
                                    // color: Color(0xFFFBB03B),
                                    color: secondColour,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          18.0),)
                                ),
                                SizedBox(width: 10,),
                                RaisedButton(
                                    onPressed: () {
                                      print("Button is pressed");
                                      setState(() {
                                        third = !third;
                                        if (third == true) {
                                          thirdColour = Color(0xFFFBB03B);
                                          firstColour = Colors.transparent;
                                          secondColour = Colors.transparent;
                                          second = false;
                                          first = false;
                                        }
                                      });
                                    },
                                    child: new Text("NEW RELEASES",
                                      style: TextStyle(fontSize: 19,
                                          color: Color(0xFF42210B)),),
                                    color: thirdColour,
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: new BorderRadius.circular(
                                          18.0),)
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Container(
                            color: Colors.transparent,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            height: 330,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: 10,
                                    itemBuilder: (BuildContext context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(left: 40.0),
                                        child: Stack(
                                          overflow: Overflow.visible,
                                          children: [
                                            Container(
                                              height: 285,
                                              width: 200,
                                              decoration: BoxDecoration(
                                                image: new DecorationImage(
                                                  image: new AssetImage(
                                                      "images/Asset1.png"),
                                                  fit: BoxFit.fill,
                                                ),
                                                // color:Color(0xFFFBB03B),
                                                color: Colors.black87,
                                                borderRadius: BorderRadius
                                                    .circular(35),
                                              ),
                                            ),
                                            Positioned(
                                                bottom: 125,
                                                left: 170,
                                                child: CircleAvatar(
                                                  backgroundColor: Color(
                                                      0XFF42210B),
                                                  child: CircleAvatar(
                                                      radius: 24,
                                                      backgroundColor: Color(
                                                          0XFFFBB03B),
                                                      child: Text("\u20B9"+
                                                        popularlist[index].price
                                                            .toString(),
                                                        style: TextStyle(
                                                            fontSize: 15.5,
                                                            color: Color(
                                                                0XFF42210B)),)),
                                                  radius: 26,
                                                )),
                                            Positioned(
                                                bottom: 44.5,
                                                left: 0,
                                                right: 0,
                                                child: Container(
                                                  width: 200,
                                                  height: 80,
                                                  decoration: BoxDecoration(
                                                    // color:Color(0xFFFBB03B),
                                                    color: Color(0XFF8C6239),
                                                    borderRadius: BorderRadius
                                                        .only(
                                                      bottomLeft: Radius
                                                          .circular(35),
                                                      bottomRight: Radius
                                                          .circular(35),
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                  SizedBox(width: 40,)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Center(child: Text("jhgjutuuybuykuy")),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
