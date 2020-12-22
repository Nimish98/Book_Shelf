import 'dart:io';

import 'package:book_management/Class/UserDetails.dart';
import 'package:book_management/Other/CRUD.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

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
      secondChild:Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height-200,
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
                      return Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          tileColor: Colors.orange,
                          title: Text(map.values.elementAt(i)["bookName"]),
                          onTap: (){
                          
                          }
                        ),
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator(),);
              },
            ),
          ),
          Align(
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
                  showDialog(
                    context: context,
                    builder: (BuildContext build){
                      loading = false;
                      action = "ex";
                      s = false;
                      fileName = null;
                      return StatefulBuilder(
                        builder: (builder,setState)=> SimpleDialog(
                          title: Text("Books Details", textAlign: TextAlign.center,),
                          contentPadding: EdgeInsets.all(10),
                          children: [
                            Form(
                              key: key,
                              child: Column(
                                children: [
                                  SizedBox(height: 20,),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: "Name of the book",
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
                                  SizedBox(height: 10,),
                                  
                                  Row(
                                    children: [
                                      Text("Exchange"),
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
                                      ),
                                      Text("Sell"),
                                    ],
                                  ),
                                  FlatButton(
                                      onPressed:() async{
                                        FilePickerResult file = await FilePicker.platform.pickFiles();
                                        print("name" + file.names.toString());
                                        setState((){
                                          fileName = file.files[0].name;
                                        });
                                        pdf = File(file.files[0].path);
                                      },
                                      child: Icon(Icons.upload_rounded)),
                                  fileName != null?Text(fileName):Container(),
                                  
                                  SizedBox(height: 20,),
                                  
                                  RaisedButton(
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
                                    child: loading?Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),),):Text("Submit"),
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
          ),
        ],
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
