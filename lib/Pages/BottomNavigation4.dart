import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Selling extends StatefulWidget {
  @override
  _SellingState createState() => _SellingState();
}

class _SellingState extends State<Selling> {
  bool getStarted = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      secondChild:Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: EdgeInsets.only(bottom:100,right: 25),
          child: FloatingActionButton(
            elevation: 12,
            hoverElevation: 5,
            child: Icon(
              Icons.add,
              color:  Color.fromRGBO(251, 176, 59, 1),
            ),
            backgroundColor: Color(0xFF8C6239),
            onPressed: () {
              print("Floating Action Button pressed");
            },
          ),
        ),
      ),
      firstChild: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Spacer(
              flex: 2,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 25,
              child: Text(
                "Welcome to our book store,the best place for finding a book",
                textAlign: TextAlign.center,
                maxLines: 4,
                style: TextStyle(
                  fontSize: 26,
                  color: Color(0xFF42210B),
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Image.asset(
              "images/bookshelf.png",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height / 2 - 125,
              width: MediaQuery.of(context).size.width,
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 25,
              child: Text(
                "Sell & exchange your book on our e-book store,with hassle free transactions",
                textAlign: TextAlign.center,
                maxLines: 4,
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF42210B),
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Container(
              height: 45,
              child: RaisedButton(
                onPressed: () {
                  print("Get Started");
                  setState(() {
                    getStarted = true;
                  });
                },
                elevation: 15,
                child: Text(
                  "GET STARTED",
                  style: TextStyle(
                      fontSize: 23,
                      color: Color.fromRGBO(251, 176, 59, 1),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 3
                  ),
                ),
                color: Color(0xFF8C6239),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ),
            Spacer(
              flex: 3,
            ),
          ],),
      ),
      duration:Duration(
        seconds: 15
      ),
      crossFadeState: getStarted==true?CrossFadeState.showSecond:CrossFadeState.showFirst,
      firstCurve: Curves.easeInSine,
      secondCurve: Curves.elasticOut,
      sizeCurve: Curves.linear
    );
  }
}
