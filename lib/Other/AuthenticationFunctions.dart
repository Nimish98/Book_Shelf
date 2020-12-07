import 'package:book_management/Class/Login.dart';
import 'package:book_management/Class/UserDetails.dart';
import 'package:book_management/Other/WriteData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

Future<User> loginUser(LoginField loginField) async {
	try {
		UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
				email: loginField.email, password: loginField.password);
		if(user.user != null){
			return user.user;
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