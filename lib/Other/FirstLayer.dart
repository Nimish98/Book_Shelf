import 'dart:io';

import 'package:book_management/Class/UserDetails.dart';
import 'package:book_management/Other/CRUD.dart';
import 'package:book_management/Other/Loader.dart';
import 'package:book_management/Pages/BloodBank.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';


class FirstLayer extends StatefulWidget {
  
  final UserDetails userDetails;

  const FirstLayer({Key key, this.userDetails}) : super(key: key);
  @override
  _FirstLayerState createState() => _FirstLayerState();
}

class _FirstLayerState extends State<FirstLayer> {
  bool isOpen=false;
  File userImage;
  final Color primary = Color.fromRGBO(242, 180, 120, 0.7);

  final TextStyle style = TextStyle(
    color: Color(0xFF42210B),
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );

  bool toggle =false;
  
  
  void _pickImageGallery() async{
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage.path);
    FirebaseStorage firebaseStorage =FirebaseStorage.instance;
    Reference ref = firebaseStorage.ref().child("UserImage").child(widget.userDetails.email.toString());
    final UploadTask uploadTask = ref.putFile(
        pickedImageFile,
    );
    
    setState(() {
      userImage=pickedImageFile;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children:[
            Ink(
              decoration: BoxDecoration(
                color: Color.fromRGBO(251, 176, 59, 0.75),
              ),
            ),
            Positioned(
              top:40,
              left: 25,
              child: Container(
                width:70,
                child: Text(
                    "Hey!!"+"\n${widget.userDetails.userName}",
                    overflow: TextOverflow.fade,
                    maxLines: 2,
                    style: TextStyle(
                      color: Color(0xFF42210B),
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    )
                ),
              ),
            ),
            Positioned(
              top: -100.0,
              left: 100.0,
              child: Transform.rotate(
                angle: -0.5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: primary.withOpacity(0.5),
                  ),
                  width: 150,
                  height: 300,
                ),
              ),
            ),
            Positioned(
              bottom: -120.0,
              right: 90.0,
              child: Transform.rotate(
                angle: -0.8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: primary.withOpacity(0.5),
                  ),
                  width: 150,
                  height: 300,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    GestureDetector(
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                              color: Color(0xFF8C6239),
                              borderRadius: BorderRadius.circular(70.0)
                          ),
                          child: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            backgroundImage: widget.userDetails.image!=null?NetworkImage(widget.userDetails.image):AssetImage("images/icon.png"),
                            radius: 10,
                          ),
                        ),
                      ),
                      onTap: () {
                        _pickImageGallery();
                        print("image");
                      },
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: (){},
                      splashColor: primary,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Profile",
                          style: style,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     SizedBox(
                //       width: 20,
                //     ),
                //     InkWell(
                //       onTap: (){},
                //       splashColor: primary,
                //       child: Padding(
                //         padding: const EdgeInsets.all(16.0),
                //         child: Text(
                //           "Notification",
                //           style: style,
                //           textAlign: TextAlign.center,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          isOpen=true;
                        });
                        Navigator.push(context,MaterialPageRoute(
                        builder: (context) => BloodBank(
                          userDetails: widget.userDetails,
                        )));
                        showDialog(
                            context: context,
                          builder:(BuildContext context)=>BloodBankLoader(state: isOpen,)
                        );
    },
                      splashColor: primary,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Blood Bank",
                                style: style,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Switch(
                      value: toggle,
                      onChanged: (value){
                        setState(() {
                          toggle= value;
                        });
                        if(toggle==true){
                          Fluttertoast.showToast(
                            toastLength: Toast.LENGTH_LONG,
                            msg: "Blood Bank Notifications are turned ON\nMake sure you provide your blood group in the section",
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Color(0xFF8C6239),
                            textColor: Color.fromRGBO(251, 176, 59, 1)
                          );
                          writeUserDetailsBloodBank(widget.userDetails,  "B-");
                        }
                        else{
                          Fluttertoast.showToast(
                            msg: "Blood Bank Notifications are turned OFF",
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Color(0xFF8C6239),
                            textColor: Color.fromRGBO(251, 176, 59, 1),
                          );
                          writeUserDetailsBloodBank(widget.userDetails, "null");
                        }
                      },
                      activeColor: Color(0xFF8C6239),
                      activeTrackColor: Color(0xFF42210B),
                      inactiveTrackColor: Color.fromRGBO(242, 180, 125, 0.9),
                      inactiveThumbColor: Color.fromRGBO(242, 180, 120, 1),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: (){},
                      splashColor: primary,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Settings",
                          style: style,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: (){},
                      splashColor: primary,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "About Us",
                          style: style,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: (){},
                      splashColor: primary,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "SignOut",
                          style: style,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

