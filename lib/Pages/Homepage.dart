import 'dart:ui';
import 'package:book_management/Class/Books.dart';
import 'package:book_management/Class/UserDetails.dart';
import 'package:book_management/Other/CRUD.dart';
import 'package:book_management/Other/List.dart';
import 'package:book_management/Pages/BottomNavigation2.dart';
import 'package:book_management/Pages/BottomNavigation3.dart';
import 'package:book_management/Pages/BottomNavigation4.dart';
import 'package:book_management/Pages/DetailsPage.dart';
import 'package:book_management/Pages/Functions.dart';
import 'package:flutter/material.dart';
import 'package:book_management/Other/background.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:book_management/Other/FirstLayer.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class HomePage extends StatefulWidget{
  final UserDetails userDetails;

  const HomePage({Key key, this.userDetails}) : super(key: key);
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<Books> temp;
  List<Books> filtered = [];
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;
  bool isOpen = false;
  bool isPlaying = false;

  bool first = false,
      second = false,
      third = false;
  var firstColour = Color(0xFFFBB03B),
      secondColour = Color.fromRGBO(242, 180, 125, 0.8),
      thirdColour = Color.fromRGBO(242, 180, 125, 0.8);
  PageController _pageController;
  int _page = 0;

  void _navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }
  @override
  void initState() {
    print(widget.userDetails.email);
    super.initState();
    _pageController = PageController(initialPage: 0);
    readBooks().then((value){
      setState(() {
        temp =value;
        filtered.addAll(temp);
      });
    });
    Future.delayed(Duration.zero, () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog(context);
        },
      );
    });
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          FirstLayer(userDetails: widget.userDetails,),

          AnimatedContainer(
            transform: Matrix4Transform()
                .translate(x: xoffSet, y: yoffSet)
                .rotate(angle)
                .matrix4,
            duration: Duration(milliseconds: 200),
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
                        SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 40,
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
                              SizedBox(height: 20),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(width: 10,),
                                    RaisedButton(
                                        onPressed: () {
                                          print("Button is pressed");
                                          readBooks().then((value){
                                            setState(() {
                                              temp = value;
                                            });
                                          });
                                          setState(() {
                                            first = !first;
                                            if (first == true) {
                                              firstColour = Color(0xFFFBB03B);
                                              secondColour = Color.fromRGBO(242, 180, 125, 0.8);
                                              thirdColour = Color.fromRGBO(242, 180, 125, 0.8);
                                              second = false;
                                              third = false;
                                            }
                                          });
                                        },
                                        child: new Text("POPULAR",
                                          style: TextStyle(fontSize: 19,
                                              color: Color(0xFF42210B)),),
                                        color: firstColour,
                                        elevation: 5,
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
                                              firstColour = Color.fromRGBO(242, 180, 125, 0.8);
                                              thirdColour = Color.fromRGBO(242, 180, 125, 0.8);
                                              first = false;
                                              third = false;
                                            }
                                            // Temp=Recommendedlist;
                                          });
                                        },
                                        child: new Text("RECOMMENDED",
                                          style: TextStyle(fontSize: 19,
                                              color: Color(0xFF42210B)),),
                                        color: secondColour,
                                        elevation: 5,
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
                                              firstColour = Color.fromRGBO(242, 180, 125, 0.8);
                                              secondColour = Color.fromRGBO(242, 180, 125, 0.8);
                                              second = false;
                                              first = false;
                                            }
                                            // Temp= NewReleaseslist;
                                          });
                                        },
                                        child: new Text("NEW RELEASES",
                                          style: TextStyle(fontSize: 19,
                                              color: Color(0xFF42210B)),),
                                        color: thirdColour,
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: new BorderRadius.circular(
                                              18.0),)
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 15.0,),
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
                                  child: temp != null?Row(
                                    children: [
                                      ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount:temp.length,
                                        itemBuilder: (BuildContext context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(left: 40.0),
                                            child: GestureDetector(
                                              child: Stack(
                                                overflow: Overflow.visible,
                                                children: [
                                                  Container(
                                                    height: 285,
                                                    width: 200,
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
                                                            temp[index].name,
                                                            maxLines: 4,
                                                            style: TextStyle(
                                                              color: Color(0xFF42210B),
                                                              fontSize: 17,
                                                              fontWeight: FontWeight.w700,
                                                            )
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 285,
                                                    width: 200,
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
                                                                  text: "${temp[index].price}"
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
                                                            padding:  EdgeInsets.only(left:10.0,right: 2),
                                                            child: Container(
                                                              width: 200,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                      "INTRODUCTION:",
                                                                      style: TextStyle(
                                                                        color: Color(0xFF42210B),
                                                                        fontSize: 15,
                                                                        fontWeight: FontWeight.w700,
                                                                        decoration: TextDecoration.underline,
                                                                        letterSpacing: 1.5
                                                                      )
                                                                  ),
                                                                  Text(
                                                                      temp[index].intro,
                                                                      overflow: TextOverflow.ellipsis,
                                                                      maxLines: 2,
                                                                      style: TextStyle(
                                                                        height: 1.4,
                                                                        color: Color(0xFF8C6239),
                                                                        fontSize: 12,
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
                                                          temp[index].rating.toString(),
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
                                                ],
                                              ),
                                              onTap: (){
                                                Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage(
                                                  books: temp[index],
                                                  userDetails: widget.userDetails,
                                                )));
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(width: 40,)
                                    ],
                                  ):Center(child: CircularProgressIndicator()),
                                ),
                              ),
                              Container(
                                height: 100,
                                child: ListView.separated(
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return SizedBox(
                                      width: 20,
                                    );
                                  },
                                  itemCount: verticalList.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Column(
                                      children: [
                                        Container(
                                          child: RaisedButton(
                                            onPressed: () {
                                              if(verticalList[index].s == "Fiction"){
                                                filtered.clear();
                                                filtered.addAll(temp);
                                                setState(() {
                                                  filtered.removeWhere((element) => element.genre != "Fiction");
                                                });
                                                print(filtered.length);
                                              }
                                              
                                              else if (verticalList[index].s =="Science"){
                                                filtered.clear();
                                                filtered.addAll(temp);
                                                setState(() {
                                                  filtered.removeWhere((element) => element.genre != "Sci-FI");
                                                });
                                              }
                                              
                                              else if(verticalList[index].s =="Education"){
                                                filtered.clear();
                                                filtered.addAll(temp);
                                                setState(() {
                                                  filtered.retainWhere((element) => element.genre =="Academics");
                                                });
                                              }
                                            },
                                            child: Center(
                                              child: Icon(
                                                verticalList[index].icon,
                                                color: Color.fromRGBO(
                                                    251, 176, 59, 1),
                                              ),
                                            ),
                                            color: Color(0xFF8C6239),
                                            elevation: 10,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(30)),
                                              side: BorderSide(
                                                color: Color.fromRGBO(
                                                    251, 176, 59, 1),
                                                width: 2,
                                              ),
                                            ),
                                          ),
                                          height: 60,
                                          width: 60,
                                        ),
                                        Spacer(
                                          flex: 1,
                                        ),
                                        Text(
                                            verticalList[index].s,
                                          textAlign:TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17
                                          ),
                                        ),
                                        Spacer(
                                          flex: 5,
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
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
                                  child: filtered != null?Row(
                                    children: [
                                      ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount:filtered.length,
                                        itemBuilder: (BuildContext context, index) {
                                          return Padding(
                                            padding: EdgeInsets.only(left: 40.0),
                                            child: GestureDetector(
                                              child: Stack(
                                                overflow: Overflow.visible,
                                                children: [
                                                  Container(
                                                    height: 285,
                                                    width: 200,
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
                                                            filtered[index].name,
                                                            maxLines: 4,
                                                            style: TextStyle(
                                                              color: Color(0xFF42210B),
                                                              fontSize: 17,
                                                              fontWeight: FontWeight.w700,
                                                            )
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 285,
                                                    width: 200,
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
                                                                  text: "${filtered[index].price}"
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
                                                            padding:  EdgeInsets.only(left:10.0,right: 2),
                                                            child: Container(
                                                              width: 200,
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                      "INTRODUCTION:",
                                                                      style: TextStyle(
                                                                          color: Color(0xFF42210B),
                                                                          fontSize: 15,
                                                                          fontWeight: FontWeight.w700,
                                                                          decoration: TextDecoration.underline,
                                                                          letterSpacing: 1.5
                                                                      )
                                                                  ),
                                                                  Text(
                                                                      filtered[index].intro,
                                                                      overflow: TextOverflow.ellipsis,
                                                                      maxLines: 2,
                                                                      style: TextStyle(
                                                                        height: 1.4,
                                                                        color: Color(0xFF8C6239),
                                                                        fontSize: 12,
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
                                                          filtered[index].rating.toString(),
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
                                                ],
                                              ),
                                              onTap: (){
                                                Navigator.push(context,MaterialPageRoute(builder: (context) => DetailPage(
                                                  books: filtered[index],
                                                  userDetails: widget.userDetails,
                                                )));
                                              },
                                            ),
                                          );
                                        },
                                      ),
                                      SizedBox(width: 40,)
                                    ],
                                  ):Center(child: CircularProgressIndicator()),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Favourites(
                      userDetails: widget.userDetails,
                    ),
                    Organisation(),
                    Stack(
                      children: [
                        backGround(context),
                        Selling(
                          userDetails: widget.userDetails,
                        ),
                      ],
                    ),
                  ],
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
                  BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Buy/Sell/Exchange',)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
