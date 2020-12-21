import 'package:book_management/Class/UserDetails.dart';
import 'package:book_management/Other/CRUD.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class BloodBank extends StatefulWidget {
  final UserDetails userDetails;

  const BloodBank({Key key, this.userDetails}) : super(key: key);
  @override
  _BloodBankState createState() => _BloodBankState();
}

class _BloodBankState extends State<BloodBank> {
  
  Future<bool> _willPopCallback() async {
    setState(() {
      statusBar=Color.fromRGBO(242, 180, 125, 0.8);
    });
    return true;
  }
  
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String bloodGroup ;
  bool donor=false;
  bool reciever=true;
  Color statusBar=Color(0xFF989898);
  
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarColor: statusBar,
          statusBarIconBrightness: Brightness.dark,
        ));
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Image.asset(
                    "images/Blood.png",
                    fit: BoxFit.fitWidth,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.topCenter,
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(
                        flex: 2,
                      ),
                      Text(
                        'DONOR',
                        style: TextStyle(
                            color:Color(0xFF969696),
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0
                        ),
                      ),
                      Radio(
                        value: true,
                        groupValue: donor,
                        onChanged: (value){
                          setState(() {
                            donor=value;
                            reciever=false;
                          });
                        },
                        activeColor: Color(0xFFFF3D30),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        'ACCEPTOR',
                        style: TextStyle(
                            color:Color(0xFF969696),
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0
                        ),
                      ),
                      Radio(
                        value: true,
                        groupValue: reciever,
                        onChanged: (value){
                          setState(() {
                            reciever=value;
                            donor=false;
                          });
                        },
                        activeColor: Color(0xFFFF3D30),
                      ),
                      Spacer(
                        flex: 1,
                      )
                    ],
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFCCCCCC),
                        borderRadius: BorderRadius.circular(65.0)
                    ),
                    width: 315,
                    height: 58,
                    child: Padding(
                      padding: EdgeInsets.only(top: 1),
                      child: Form(
                        key: key,
                        child: TextFormField(
                          onChanged: (value){
                            bloodGroup = value;
                          },
                          validator: (value){
                            if(value.isEmpty){
                              return "Please Enter Your Blood Group";
                            }
                            return null;
                          },
                          cursorColor: Color(0xFFFF3D30),
                          textInputAction: TextInputAction.next,
                          style: TextStyle(fontSize: 16),
                          decoration: InputDecoration(
                            focusColor: Colors.black,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              vertical: 17.0,
                              horizontal:26,
                            ),
                            hintText:"Enter Your Blood Group Here",
                            hintStyle: TextStyle(color: Color(0xFFFF3D30),fontSize: 16),
                            fillColor:  Color(0xFFCCCCCC),
                            filled: false,
                          ),
                        ),
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
                        if(key.currentState.validate()) {
                          key.currentState.save();
                          if (reciever) {
                            writeUserDetailsBloodBank(widget.userDetails, bloodGroup);
                          }
                          
                          if(donor){
                            bloodRequired(bloodGroup, widget.userDetails);
                          }
                        }
                      },
                      elevation: 12,
                      child: Text(
                        "SUBMIT",
                        style: TextStyle(
                            fontSize: 23,
                            color: Color(0xFFCCCCCC),
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3
                        ),
                      ),
                      color: Color(0xFFFF3D30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        side: BorderSide(
                          color: Color(0xFFCCCCCC),
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
              color: Color(0xFFFCE6DA),
            ),
          ),
        ),
      ),
    );
  }
}

