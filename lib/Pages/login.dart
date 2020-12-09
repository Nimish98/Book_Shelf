import 'package:book_management/Class/Login.dart';
import 'package:book_management/Other/AuthenticationFunctions.dart';
import 'package:book_management/Pages/Functions.dart';
import 'package:book_management/Pages/Signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:book_management/Pages/Homepage.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return LoginState();
  }
}
class LoginState extends State<Login>{
  
  LoginField loginField;
  String email, password;
  bool loading = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            color: Color.fromRGBO(242, 180, 120, 0.8),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  color: Color.fromRGBO(242, 180, 120, 0.8),
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipPath(
                          child: Container(
                            color: Colors.amber,
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: Image(
                              image: AssetImage("images/loginbg.jpg"),
                              fit: BoxFit.fill,
                              color: Colors.black38,
                              colorBlendMode: BlendMode.darken,
                            ),
                          ),
                          clipper: MyClipper()
                      ),
                    ],
                  ),
                ),
              Padding(
                padding: EdgeInsets.only(top: 300.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("LOGIN",
                           style:TextStyle(fontSize: 34,color: Color(0xFF42210B)),),
                       ],
                     ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                cursorColor: Color(0xFF42210B),
                                style: TextStyle(fontSize: 16,fontFamily:"Avenir LT Std 45 Book"),
                                decoration: inputDecoration(hintText: "Email or Phone Number"),
                                onChanged: (value){
                                  email = value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                cursorColor: Color(0xFF42210B),
                                style: TextStyle(fontSize: 16,fontFamily:"Avenir LT Std 45 Book"),
                                decoration: inputDecoration(hintText: "Password"),
                                onChanged: (value){
                                  password = value;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 58,
                            width: 325,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Color(0xFF8C6239),
                            ),
                            child: FlatButton(
                              textColor: Color(0xFFFBB03B),
                              onPressed: () async{
                                setState(() {
                                  loading = true;
                                });
                                loginField = LoginField(email, password);
                                var response = await loginUser(loginField);
                                if(response != null) {
                                  Navigator.pop(context);
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => HomePage()));
                                }
                              },
                              child: loading?CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFC69C6D)),) :Text("LOGIN",
                                style: TextStyle(fontSize: 21,fontFamily: "Myriad"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Forgot Password?",
                            style:TextStyle(fontSize: 16,color: Color(0xFF42210B)),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RichText(
                            text: TextSpan(
                                text: 'Don\'t have an account?',
                                style: TextStyle(
                                    color: Color(0xFF42210B), fontSize: 16),
                                children: <TextSpan>[
                                  TextSpan(text: ' Sign Up',
                                      style: TextStyle(color: Color(0xFFEA981C), fontSize: 16),
                                      recognizer: TapGestureRecognizer()..onTap = () {
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => SignUp()));
                                  })
                                ]
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
              )
              ],
            ),
          ),
        )
    );
  }
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {

   var path = Path();
   path.lineTo(0.0, size.height/1.9);
   var firstControlPoint = Offset(size.width/4-30,size.height/2.7);
   var firstEndPoint = Offset(size.width*0.75+20, size.height/2-40);
   path.quadraticBezierTo(firstControlPoint.dx,firstControlPoint.dy, firstEndPoint.dx,firstEndPoint.dy);
   var secondControlPoint = Offset(size.width-1.0, size.height/2-20);
   var secondEndPoint = Offset(size.width, size.height/2-80);
   path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy, secondEndPoint.dx, secondEndPoint.dy);
   path.lineTo(size.width, size.height-40);
   path.lineTo(size.width, 0.0);
   path.close();
   return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
