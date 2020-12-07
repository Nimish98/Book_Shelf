import 'package:book_management/Class/UserDetails.dart';
import 'package:book_management/Other/AuthenticationFunctions.dart';
import 'package:book_management/Pages/Functions.dart';
import 'package:flutter/material.dart';


class SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return SignUpState();
  }
}
class SignUpState extends State<SignUp>{
  
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  UserDetails userDetails;
  
  
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
                      onChanged: (String value){
                        userDetails.email = value;
                      },
                      validator: (String value){
                        if(value = null){
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
                      textInputAction: TextInputAction.next,
                      onChanged: (String value){
                        userDetails.userName = value;
                      },
                      validator: (value){
                        if(value == null){
                          return "No text has been entered";
                        }
                        else if(value.length<10){
                          return "Invalid Phone number";
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 16,fontFamily:"Avenir LT Std 45 Book"),
                      decoration: inputDecoration(hintText: "Name"),
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
                      textInputAction: TextInputAction.next,
                      onChanged: (String value){
                        userDetails.userPhone = value;
                      },
                      validator: (value){
                        if(value == null){
                          return "No text has been entered";
                        }
                        else if(value.length<10){
                          return "Invalid Phone number";
                        }
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
                      validator: (value){
                        if(value = null){
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
                      controller: passwordController,
                      style: TextStyle(fontSize: 16,fontFamily:"Avenir LT Std 45 Book"),
                      decoration: inputDecoration(hintText: "Password"),
                      validator: (value){
                        if(value ==null){
                          return "No text has been entered";
                        }
                        if(value.length<6){
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
                      style: TextStyle(fontSize: 16,fontFamily:"Avenir LT Std 45 Book"),
                      decoration: inputDecoration(hintText: "Confirm Password"),
                      validator: (String value){
                        if(passwordController.text != value){
                          return "Password not matching";
                        }
                        if(value == null){
                          return "Please Enter your password again to confirm";
                        }
                        return null;
                      },
                      onChanged: (String value){
                        userDetails.password = value;
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
                      bool check;
                      if(key.currentState.validate()){
                        check = await userSignUp(userDetails);
                      }
                      if(check) {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => SignUp()));
                      }
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
        ),
      )
    );
  }
}
