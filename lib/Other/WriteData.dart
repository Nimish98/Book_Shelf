import 'package:book_management/Class/UserDetails.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';



Future<void> writeUserData(UserDetails userData) async{
	FirebaseDatabase db =FirebaseDatabase.instance;
	DatabaseReference dbr = db.reference();
	
	try{
		dbr.child("Users")
				.child(userData.email.replaceAll('.', ','))
				.set({
			"Name":userData.userName,
			"PhoneNumber":userData.userPhone,
			"Email":userData.email,
			"SignUpDate": DateTime.now().toUtc().toString(),
		});
	}on PlatformException catch(e){
		print("Error");
		Fluttertoast.showToast(msg: e.message);
	}catch(e){
		print(e);
	}
}