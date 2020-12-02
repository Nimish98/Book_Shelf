import 'package:flutter/material.dart';
import 'Functions.dart';


class SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return SignUpState();
  }
}
class SignUpState extends State<SignUp>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0x80F2B478),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 80,),
              Text("Create Account",
              style: TextStyle(fontSize: 34,color: Color(0xFF42210B)),),
              SizedBox(height: 50,),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFC69C6D),
                    borderRadius: BorderRadius.circular(65.0)
                ),
                width: 325,
                height: 58,
                child: Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: TextFormField(
                    style: TextStyle(fontSize: 16,fontFamily:"Avenir LT Std 45 Book"),
                    decoration: inputDecoration(hintText: "Email"),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFC69C6D),
                    borderRadius: BorderRadius.circular(65.0)
                ),
                width: 325,
                height: 58,
                child: Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: TextFormField(
                    style: TextStyle(fontSize: 16,fontFamily:"Avenir LT Std 45 Book"),
                    decoration: inputDecoration(hintText: "Phone Number"),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFC69C6D),
                    borderRadius: BorderRadius.circular(65.0)
                ),
                width: 325,
                height: 58,
                child: Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: TextFormField(
                    style: TextStyle(fontSize: 16,fontFamily:"Avenir LT Std 45 Book"),
                    decoration: inputDecoration(hintText: "Genre"),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFC69C6D),
                    borderRadius: BorderRadius.circular(65.0)
                ),
                width: 325,
                height: 58,
                child: Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: TextFormField(
                    style: TextStyle(fontSize: 16,fontFamily:"Avenir LT Std 45 Book"),
                    decoration: inputDecoration(hintText: "Password"),
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Container(
                decoration: BoxDecoration(
                    color: Color(0xFFC69C6D),
                    borderRadius: BorderRadius.circular(65.0)
                ),
                width: 325,
                height: 58,
                child: Padding(
                  padding: EdgeInsets.only(top: 1),
                  child: TextFormField(
                    style: TextStyle(fontSize: 16,fontFamily:"Avenir LT Std 45 Book"),
                    decoration: inputDecoration(hintText: "Confirm Password"),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Container(
                height: 58,
                width: 325,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xFF8C6239),
                ),
                child: FlatButton(
                  textColor: Color(0xFFFBB03B),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text("SIGNUP",
                    style: TextStyle(fontSize: 21,fontFamily: "Myriad"),
                  ),
                ),
              ),
              SizedBox(height: 50,),
            ],
          ),
        ),
      )
    );
  }
}
