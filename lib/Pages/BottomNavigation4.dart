import 'dart:io';
import 'dart:ui';

import 'package:book_management/Class/UserDetails.dart';
import 'package:book_management/Other/CRUD.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class Selling extends StatefulWidget {
  final UserDetails userDetails;

  const Selling({Key key, this.userDetails}) : super(key: key);
  @override
  _SellingState createState() => _SellingState();
}

class _SellingState extends State<Selling> {
  
  String bookName;
  String location;
  bool loading = false;
  String action = "ex";
  String fileName;
  bool s = false;
  File pdf;
  bool getStarted = false;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    return AnimatedCrossFade(
      secondChild:SingleChildScrollView(
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.all(10),
                  child: StreamBuilder(
                    stream: FirebaseDatabase.instance.reference().child("BookSelf").child("Sell,Exc").onValue,
                    builder: (BuildContext build, AsyncSnapshot<Event> value){
                      if(value.hasData){
                        Map<dynamic,dynamic> map = value.data.snapshot.value;
                        print(map.values.length);
                        print(map.values.elementAt(0));
                        return ListView.builder(
                          itemCount: map.values.length,
                          itemBuilder: (BuildContext build, int i){
                            print(map.values.elementAt(i)["action"]);
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(15),
                                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Book Name:",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFF42210B),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(
                                            flex: 1,
                                          ),
                                          Text(
                                              map.values.elementAt(i)["bookName"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF42210B),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(
                                            flex: 3,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Price:",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFF42210B),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(
                                            flex: 1,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                                children: <TextSpan>[
                                                  TextSpan(
                                                    text:" \u20B9",
                                                    style: TextStyle(
                                                      fontSize: 16.5,
                                                      fontWeight: FontWeight.w600,
                                                      color: Color(0xFF42210B),
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text: " 248"
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w400,
                                                      color: Color(0xFF42210B),
                                                    ),
                                                  ),
                                                ]
                                            ),
                                          ),
                                          Spacer(
                                            flex: 8,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Person Name: ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFF42210B),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(
                                            flex: 1,
                                          ),
                                          Text(
                                            map.values.elementAt(i)["PostedBy"],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF42210B),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(
                                            flex: 3,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "For Sell/Exchange:",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 18,
                                              color: Color(0xFF42210B),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Spacer(
                                            flex: 1,
                                          ),
                                          Text(
                                            map.values.elementAt(i)["action"] == "ex"?"Exchange":"Sell",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color(0xFF42210B),
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Spacer(
                                            flex: 3,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          RaisedButton(
                                            onPressed: (){
                                            
                                            },
                                            elevation: 10,
                                            child: Text(
                                              "BUY NOW",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Color.fromRGBO(251, 176, 59, 1),
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 2
                                              ),
                                            ),
                                            color: Color(0xFF8C6239),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(20))
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                      border: Border.all(
                                        color: Color(0xFF42210B),
                                        width: 2,
                                      ),
                                    color: Color(0xFFFFCE7E),
                                  ),
                                  ),
                              ],
                            );
                          },
                        );
                      }
                      return Center(child: CircularProgressIndicator( valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF8C6239),)),);
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              top: 580,
              left: 280,
              child: FloatingActionButton(
                elevation: 12,
                hoverElevation: 5,
                child: Icon(
                  Icons.add,
                  color:  Color.fromRGBO(251, 176, 59, 1),
                ),
                backgroundColor: Color(0xFF8C6239),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext build){
                        loading = false;
                        action = "ex";
                        s = false;
                        fileName = null;
                        return StatefulBuilder(
                          builder: (builder,setState)=> SimpleDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              side: BorderSide(
                                color: Color(0xFF42210B),
                                width: 2,
                              ),
                            ),
                            backgroundColor: Color.fromRGBO(242, 180, 125, 1),
                            title: Text("Book Details",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF42210B),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(10),
                            children: [
                              Form(
                                key: key,
                                child: Column(
                                  children: [
                                    SizedBox(height: 20,),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          focusedBorder: InputBorder.none,
                                          hintText: "Name of the book",
                                          hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF42210B),
                                            fontWeight: FontWeight.w400,
                                          )
                                      ),
                                      validator: (value){
                                        if(value.length ==0){
                                          return "Enter Book Name";
                                        }
                                        return null;
                                      },
                                      onChanged: (value){
                                        bookName = value;
                                      },
                                    ),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          focusedBorder: InputBorder.none,
                                          hintText: "Price of the book",
                                          hintStyle: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF42210B),
                                            fontWeight: FontWeight.w400,
                                          )
                                      ),
                                      // validator: (value){
                                      //   if(value.length ==0){
                                      //     return "Enter Book Name";
                                      //   }
                                      //   return null;
                                      // },
                                      // onChanged: (value){
                                      //   bookName = value;
                                      // },
                                    ),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Text(
                                          "Exchange",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF42210B),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Switch(
                                          value: s,
                                          onChanged: (value){
                                            setState(() {
                                              s=value;
                                              if(s){
                                                action = "sell";
                                              }
                                              else{
                                                action = "exc";
                                              }
                                            });
                                          },
                                          activeColor: Color(0xFF8C6239),
                                          activeTrackColor: Color(0xFF42210B),
                                          inactiveTrackColor: Color.fromRGBO(242, 200, 145, 1),
                                          inactiveThumbColor: Color.fromRGBO(242, 180, 135, 1),
                                        ),
                                        Text(
                                          "Sell",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFF42210B),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    FlatButton.icon(
                                      onPressed:() async{
                                        FilePickerResult file = await FilePicker.platform.pickFiles();
                                        print("name" + file.names.toString());
                                        setState((){
                                          fileName = file.files[0].name;
                                        });
                                        pdf = File(file.files[0].path);
                                      },
                                      icon: Icon(
                                        Icons.upload_rounded,
                                        color: Color(0xFF42210B),
                                        size: 20,
                                      ),
                                      label: Text(
                                        "Upload",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF42210B),
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    fileName != null?Text(fileName):Container(),
                                    SizedBox(height: 15,),
                                    Container(
                                      width: 150,
                                      height: 40,
                                      child: RaisedButton(
                                        elevation: 6,
                                        color: Color(0xFF8C6239),
                                        onPressed: () async{
                                          if(key.currentState.validate()){
                                            setState((){
                                              loading = true;
                                            });
                                            key.currentState.save();
                                            await postSellExchange(pdf, bookName, action, widget.userDetails);
                                            setState((){
                                              loading = false;
                                            });
                                            Navigator.pop(context);
                                          }
                                        },
                                        child: loading?Center(
                                            child: CircularProgressIndicator(
                                              valueColor: AlwaysStoppedAnimation<Color>(Color.fromRGBO(251, 176, 59, 1),),
                                            )):Text(
                                          "SUBMIT",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color.fromRGBO(251, 176, 59, 1),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 3
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                          side: BorderSide(
                                            color: Color.fromRGBO(251, 176, 59, 1),
                                            width: 2,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                  );
                },
              ),
            ),
          ],
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
        seconds: 1
      ),
      crossFadeState: getStarted==true?CrossFadeState.showSecond:CrossFadeState.showFirst,
      firstCurve: Curves.easeInSine,
      secondCurve: Curves.elasticOut,
      sizeCurve: Curves.linear
    );
    
  }
}
