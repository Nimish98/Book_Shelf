import 'package:book_management/Class/UserDetails.dart';
import 'package:book_management/Other/AuthenticationFunctions.dart';
import 'package:book_management/Pages/Functions.dart';
import 'package:book_management/Pages/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return SignUpState();
  }
}
class SignUpState extends State<SignUp>{
  
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  String userName, userPhone, email, password;
  UserDetails userDetails = UserDetails();
  bool loading = false;
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color.fromRGBO(242, 180, 120, 0.8),
        child: SingleChildScrollView(
          child: Form(
            key: key,
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
                      cursorColor: Color(0xFF42210B),
                      onChanged: (String value){
                        email = value;
                      },
                      validator: (String value){
                        if(value == null){
                          return "No Text has been Entered";
                        }
                        return null;
                      },
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
                      cursorColor: Color(0xFF42210B),
                      textInputAction: TextInputAction.next,
                      onChanged: (String value){
                        userName = value;
                      },
                      validator: (value){
                        if(value == null){
                          return "No text has been entered";
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 16,fontFamily:"Avenir LT Std 45 Book"),
                      decoration: inputDecoration(hintText: "Name"),
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
                      cursorColor: Color(0xFF42210B),
                      textInputAction: TextInputAction.next,
                      onChanged: (String value){
                        userPhone = value;
                      },
                      validator: (String value){
                        if(value == null){
                          return "No text has been entered";
                        }
                        // if(value.length != 10){
                        //   return "Invalid Phone number";
                        // }
                        return null;
                      },
                      style: TextStyle(fontSize: 16,fontFamily:"Avenir LT Std 45 Book"),
                      decoration: inputDecoration(hintText: "Phone Number"),
                      keyboardType: TextInputType.phone,
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
                      cursorColor: Color(0xFF42210B),
                      validator: (value){
                        if(value == null){
                          return "No text has been entered";
                        }
                        return null;
                      },
                      onChanged: (String value){
                      },
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
                      cursorColor: Color(0xFF42210B),
                      controller: passwordController,
                      style: TextStyle(fontSize: 16,fontFamily:"Avenir LT Std 45 Book"),
                      decoration: inputDecoration(hintText: "Password"),
                      validator: (value){
                        if(value ==null){
                          return "No text has been entered";
                        }
                        if(value.length<6){
                          passwordController.clear();
                          confirmController.clear();
                          return "Please enter a password of at least 6 characters";
                        }
                        
                        return null;
                      },
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
                      cursorColor: Color(0xFF42210B),
                      controller: confirmController,
                      style: TextStyle(fontSize: 16,fontFamily:"Avenir LT Std 45 Book"),
                      decoration: inputDecoration(hintText: "Confirm Password"),
                      validator: (String value){
                        print(passwordController.text + "  2: " + value);
                        if(passwordController.text != value){
                          return "Password not matching";
                        }
                        if(value == null){
                          return "Please Enter your password again to confirm";
                        }
                        return null;
                      },
                      onChanged: (String value){
                        password = value;
                      },
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
                    onPressed: () async{
                      bool check = false;
                      if(key.currentState.validate()){
                        key.currentState.save();
                        setState(() {
                          loading= true;
                        });
                        userDetails = UserDetails(userName: userName, userPhone: userPhone, email: email, password: password);
                        check = await userSignUp(userDetails);
                      }
                      if(check) {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => Login())).then((value){
                          Fluttertoast.showToast(
                            msg: "Now Login Using Your Credentials",
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.orange,
                            textColor: Colors.white,
                          );
                        });
                      }
                      setState(() {
                        loading = false;
                      });
                    },
                    child: loading? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFC69C6D)),):Text("SIGNUP",
                      style: TextStyle(fontSize: 21,fontFamily: "Myriad"),
                    ),
                  ),
                ),
                SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      )
    );
  }
}
