import 'dart:ui';
import 'package:book_management/Other/List.dart';
import 'package:flutter/material.dart';
import 'package:book_management/Other/background.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:book_management/Other/FirstLayer.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List Temp= popularlist;
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;
  bool isOpen = false;
  bool isPlaying = false;

  bool first = false,
      second = false,
      third = false;
  var firstColour = Color(0xFFFBB03B),
      secondColour = Colors.transparent,
      thirdColour = Colors.transparent;
  PageController _pageController;
  int _page = 0;

  void _navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
  @override
  Widget popular(BuildContext context) => Container();
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
                  child: PageView(
                    physics: AlwaysScrollableScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: _onPageChanged,
                    children: <Widget>[
                      Stack(
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
                                        size: 30,
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
                                      icon: Icon(
                                        Icons.arrow_back_ios,
                                        color: Color(0xFF42210B),
                                        size: 30,
                                      ),
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
                                            Temp = popularlist;
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
                                            Temp=Recommendedlist;
                                          });
                                        },
                                        child: new Text("RECOMMENDED",
                                          style: TextStyle(fontSize: 19,
                                              color: Color(0xFF42210B)),),
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
                                            Temp= NewReleaseslist;
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
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount:Temp.length,
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
                                                    image:  DecorationImage(
                                                      image:  AssetImage(
                                                          "images/Asset1.jpg"),
                                                      fit: BoxFit.fill,
                                                    ),
                                                    color: Colors.black87,
                                                    borderRadius: BorderRadius
                                                        .circular(35),
                                                  ),
                                                ),
                                                Positioned(
                                                  bottom: 125,
                                                  left: 170,
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
                                                                text: "${Temp[index].price}"
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
                                                  bottom: 44.5,
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
                                                      width: 200,
                                                      height: 80,
                                                      child: BackdropFilter(
                                                        filter: ImageFilter.blur(
                                                          sigmaX:10,
                                                          sigmaY:8,
                                                        ),
                                                        child: Padding(
                                                          padding:  EdgeInsets.only(left:10.0),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              SizedBox(
                                                                height: 5,
                                                              ),
                                                              RichText(
                                                                text: TextSpan(
                                                                    style: TextStyle(
                                                                        height: 1.3
                                                                    ),
                                                                    children: <TextSpan>[
                                                                      TextSpan(
                                                                          text: Temp[index].tittle,
                                                                          style: TextStyle(
                                                                            color: Color(0xFF42210B),
                                                                            fontSize: 17,
                                                                            fontWeight: FontWeight.w700,
                                                                          )
                                                                      ),
                                                                      TextSpan(
                                                                          text: "\n"+Temp[index].about,
                                                                          style: TextStyle(
                                                                            color: Color(0xFF8C6239),
                                                                            fontSize: 14,
                                                                            fontWeight: FontWeight.w800,
                                                                          )
                                                                      )
                                                                    ]
                                                                ),
                                                              ),
                                                            ],
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
                                                        Temp[index].rating.toString(),
                                                        style: TextStyle(
                                                            fontSize: 17,
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
                                                    ],
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 70,
                                                  left: 55,
                                                  child: Container(
                                                    height: 100,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                        color: Color(0xFF8C6239),
                                                        borderRadius: BorderRadius.all(Radius.circular(55)),
                                                        border: Border.all(
                                                          width: 1.2,
                                                          color: Color.fromRGBO(251, 176, 59, 1),
                                                        )
                                                    ),
                                                  ),
                                                ),
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
                        ],
                      ),
                      Stack(
                        children: [
                          backGround(context),
                          Text("hey2"),
                        ],
                      ),
                      Stack(
                        children: [
                          backGround(context),
                          Text("hey3"),
                        ],
                      ),
                      Stack(
                        children: [
                          backGround(context),
                          Text("hey4"),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Visibility(
            visible: !isOpen,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SnakeNavigationBar.color(
                backgroundColor: Color.fromRGBO(251, 176, 59, 1),
                behaviour: SnakeBarBehaviour.floating,
                snakeShape: SnakeShape.circle,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                ),
                elevation: 15,
                padding: EdgeInsets.all(20),
                snakeViewColor: Color(0xFF8C6239),
                selectedItemColor: Color.fromRGBO(242, 180, 120, 1),
                unselectedItemColor: Color(0xFF42210B),
                showUnselectedLabels: false,
                showSelectedLabels: false,
                currentIndex: _page,
                onTap: (index) => setState((){
                  _page = index;
                  _navigationTapped(_page);
                }),
                items: [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favourite'),
                  BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Organisation'),
                  BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Buy/Sell/Exchange')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
