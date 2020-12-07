import 'package:book_management/Other/AuthenticationFunctions.dart';
import 'package:book_management/Pages/Signup.dart';
import 'package:book_management/Pages/login.dart';
import 'package:flutter/material.dart';

class LoginSignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return LoginSignUpState();
  }
}
class LoginSignUpState extends State<LoginSignUp>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("images/Shelf1.jpg"),
            fit: BoxFit.cover,
            color: Colors.black54,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            children: <Widget>[
              SizedBox(height: 55.0,),
              Container(
                height: 240,
               width: 255,
               child: Image(
                  image: AssetImage("images/Applogo.png"),
                  // fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 210,),
              Container(
                height: 60,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.transparent,
                  border: Border.all(color: Color(0xFF8C6239),width: 4)
                ),
                child: FlatButton(
                  textColor: Color(0xFFEA8C1F),
                  onPressed: () {
                    
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text("LOGIN",
                  style: TextStyle(fontSize: 22,fontFamily: "Myriad"),),
                ),
              ),
              SizedBox(height: 15,),
              Container(
                height: 60,
                width: 280,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xFF8C6239),
                    border: Border.all(color: Color(0xFF8C6239),width: 4)
                ),
                child: FlatButton(
                  textColor: Color(0xFFEA8C1F),
                  onPressed: () {
                    Navigator.push(context,MaterialPageRoute(builder: (context) => SignUp()));
                  },
                  child: Text("SIGNUP",
                    style: TextStyle(fontSize: 21,fontFamily: "Myriad"),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
