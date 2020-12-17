import 'package:book_management/Class/Books.dart';
import 'package:book_management/Class/UserDetails.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<List<Books>> readBooks() async{
	List<Books> booksList = [];
	DatabaseReference dbr = FirebaseDatabase.instance.reference();
	
	dbr = FirebaseDatabase.instance.reference()
			.child("BookSelf")
			.child("Books")
			.child("Academics");
	await dbr.once().then((DataSnapshot snapshot) async{
		Map<dynamic,dynamic> v = await snapshot.value;
		for(var t in v.values){
			Books temp = Books(name: t["name"], rating:t["rating"], image: t["image"], author: t["author"], intro: t["intro"], price: t["price"], location: t["location"]);
			booksList.add(temp);
			print(temp.price);
		}
	});
	print(booksList.length);
	return booksList;
}


Future<bool> writeUserDetailsBloodBank({UserDetails userDetails, String bloodGroup}) async{
	FirebaseMessaging firebaseMessaging = FirebaseMessaging();
	try {
		String fcm = await firebaseMessaging.getToken();
		print(fcm);
		await FirebaseDatabase.instance.reference()
				.child("BookSelf")
				.child("BloodBank")
				.child("UserDetails")
				.child(userDetails.email.replaceAll(".", ","))
				.set({
			"name": userDetails.userName,
			"phone": userDetails.userPhone,
			"bloodGroup": bloodGroup,
			"fcmToken": fcm,});
		return true;
	}catch(e){
		print("error" + e.toString());
		return false;
	}
}



Future<bool> bloodRequired(String bloodGroup, UserDetails userDetails) async{
	try {
		await FirebaseDatabase.instance.reference().child("Requirement").push().set(
				{
					"Bloodrequired": bloodGroup,
					"phone": userDetails.userPhone,
				});
		return true;
	}catch(e){
		print("error\n");
		print(e);
		return false;
	}
}