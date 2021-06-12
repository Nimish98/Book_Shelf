import 'package:book_management/Class/Login.dart';
import 'package:book_management/Class/UserDetails.dart';
import 'package:book_management/Other/WriteData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

Future<UserDetails> loginUser(LoginField loginField) async {
	
	DatabaseReference dbr = FirebaseDatabase.instance.reference();
	UserDetails userDetails;
	
	try {
		UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
				email: loginField.email, password: loginField.password);
		if(user.user != null){
			
			userDetails = UserDetails();
			String image;
			try {
				image = await FirebaseStorage.instance.ref()
						.child("UserImage")
						.child(loginField.email)
						.getDownloadURL();
			}catch(e){
			
			}
			dbr = FirebaseDatabase.instance.reference()
					.child("BookSelf")
					.child("Users");
			
			await dbr.once().then((value) async{
				Map<dynamic,dynamic> map = await value.value;
				for(var v in map.entries){
					if(loginField.email.replaceAll(".", ",") == v.key.toString()){
						userDetails = UserDetails(
							userName: v.value["Name"],
							userPhone: v.value["PhoneNumber"],
							email: v.value["Email"],
							password: loginField.password,
							image: image,
						);
					}
				}
			});
			print(userDetails.email);
			return userDetails;
		}
		else{
			return null;
		}
		
	}on PlatformException catch(e){
		print("error ");
		print(e.message);
		Fluttertoast.showToast(
			msg: e.message,
			gravity: ToastGravity.BOTTOM,
			backgroundColor: Color(0xFF8C6239),
			textColor: Color.fromRGBO(251, 176, 59, 1),
		);
		return null;
	}catch(e){
		print("error");
		print(e);
		Fluttertoast.showToast(
			msg: e.message,
			gravity: ToastGravity.BOTTOM,
			backgroundColor: Color(0xFF8C6239),
			textColor: Color.fromRGBO(251, 176, 59, 1),
		);
		return null;
	}
}


Future<bool> userSignUp(UserDetails userDetails) async{
	
	try {
		UserCredential userCredential = await FirebaseAuth.instance
				.createUserWithEmailAndPassword(
				email: userDetails.email, password: userDetails.password);
		
		if(userCredential.user != null) {
			await writeUserData(userDetails);
			await Fluttertoast.showToast(
				msg: "Registered Successful",
				gravity: ToastGravity.BOTTOM,
				backgroundColor: Color(0xFF8C6239),
				textColor: Color.fromRGBO(251, 176, 59, 1),
			);
			
			return true;
		}
		else{
			
			return false;
		}
	}on PlatformException catch(e){
		print("error");
		print(e.message);
		Fluttertoast.showToast(
			msg: e.message,
			gravity: ToastGravity.BOTTOM,
			backgroundColor: Color(0xFF8C6239),
			textColor: Color.fromRGBO(251, 176, 59, 1),
		);
		return false;
		
	}catch(e){
		print("error");
		print(e);
		Fluttertoast.showToast(
			msg: e.message,
			gravity: ToastGravity.BOTTOM,
			backgroundColor: Color(0xFF8C6239),
			textColor: Color.fromRGBO(251, 176, 59, 1),
		);
		return false;
	}
	
}