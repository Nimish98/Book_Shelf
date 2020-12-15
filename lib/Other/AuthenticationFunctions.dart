import 'package:book_management/Class/Login.dart';
import 'package:book_management/Class/UserDetails.dart';
import 'package:book_management/Other/WriteData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

Future<UserDetails> loginUser(LoginField loginField) async {
	
	DatabaseReference dbr = FirebaseDatabase.instance.reference();
	UserDetails userDetails;
	
	dbr = FirebaseDatabase.instance.reference()
			.child("BookSelf")
			.child("Users");
	
	dbr.once().then((value){
		Map<dynamic,dynamic> map = value.value;
		map.forEach((key, value) {
			if(loginField.email == key.toString()){
				userDetails = UserDetails(
					userName: value['Name'],
					userPhone: value['PhoneNumber'],
					email: value['Email'],
					password: loginField.password,
				);
			}
			
		});
	});
	
	try {
		UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
				email: loginField.email, password: loginField.password);
		if(user.user != null){
			
			UserDetails userDetails = UserDetails();
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
			backgroundColor: Colors.orange,
			textColor: Colors.white,
		);
		return null;
	}catch(e){
		print("error");
		print(e);
		Fluttertoast.showToast(
			msg: e.message,
			gravity: ToastGravity.BOTTOM,
			backgroundColor: Colors.orange,
			textColor: Colors.white,
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
				backgroundColor: Colors.orange,
				textColor: Colors.white,
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
			backgroundColor: Colors.orange,
			textColor: Colors.white,
		);
		return false;
		
	}catch(e){
		print("error");
		print(e);
		Fluttertoast.showToast(
			msg: e.message,
			gravity: ToastGravity.BOTTOM,
			backgroundColor: Colors.orange,
			textColor: Colors.white,
		);
		return false;
	}
	
}