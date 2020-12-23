import 'dart:io';

import 'package:book_management/Class/Books.dart';
import 'package:book_management/Class/UserDetails.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

Future<List<Books>> readBooks() async{
	List<Books> booksList = [];
	List<String> fav =[];
	DatabaseReference dbr = FirebaseDatabase.instance.reference();
	
	DatabaseReference read = dbr
			.child("BookSelf")
			.child("Books");
	
	await dbr.child("BookSelf").child("UsersFav").once().then((value) async{
		Map<dynamic,dynamic> map = await value.value;
		
		for(var v in map.values){
			for(var v2 in v.values){
				fav.add(v2['book']);
			}
		}
	}).catchError((e){
		print(e);
	});
	
	await read.once().then((DataSnapshot snapshot) async{
		Map<dynamic,dynamic> genre = await snapshot.value;
		
		for(var books in genre.entries){
			print(books.key);
			for(var booksDetails in books.value.values){
				bool f = fav.contains(booksDetails["name"].toString());
				Books temp = Books(name: booksDetails["name"], rating:booksDetails["rating"], image: booksDetails["image"], author: booksDetails["author"], intro: booksDetails["intro"],
						price: booksDetails["price"], location: booksDetails["location"],genre: books.key, fav: f);
				print(temp.fav);
				booksList.add(temp);
			}
			//
			// print(temp.price);
		}
	});
	print(booksList.length);
	return booksList;
}


Future<bool> writeUserDetailsBloodBank(UserDetails userDetails, String bloodGroup) async{
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

Future<bool> favBooks(Books books, String email) async{
	try{
		await FirebaseDatabase.instance.reference()
				.child("BookSelf")
				.child("UsersFav")
				.child(email.replaceAll(".", ","))
				.child(books.name.replaceAll(" ", ""))
				.set({
			"genre":books.genre,
			"book":books.name,
		});
		
		return true;
	}catch(e){
		print(e);
		return false;
	}
}

Future<bool> removeFavBook(Books books, String email) async{
	try{
		await FirebaseDatabase.instance.reference()
				.child("BookSelf")
				.child("UsersFav")
				.child(email.replaceAll(".", ","))
				.child(books.name.replaceAll(" ", ""))
				.remove();
		return true;
	}catch(e){
		print(e);
		return false;
	}
}


Future<List<Books>> readFavBooks(UserDetails userDetails) async{
	try{
		List<Books> books = [];
		
		DatabaseReference ref = FirebaseDatabase.instance.reference()
				.child("BookSelf")
				.child("UsersFav")
				.child(userDetails.email.replaceAll(".", ","));
		
		await ref.once().then((value) async {
			Map<dynamic, dynamic> fav = value.value;
			DatabaseReference ref2 = FirebaseDatabase.instance.reference()
					.child("BookSelf")
					.child("Books");
			for (var book in fav.values) {
				await ref2.child(book["genre"]).once().then((value) async{
					Map<dynamic,dynamic> map = value.value;
					for(var booksDetails in map.values){
						if(booksDetails["name"] == book["book"]){
							
							Books temp = Books(name: booksDetails["name"], rating:booksDetails["rating"], image: booksDetails["image"], author: booksDetails["author"], intro: booksDetails["intro"],
								price: booksDetails["price"], location: booksDetails["location"],genre: book["genre"], fav: false);
							books.add(temp);
							print(temp.name);
						}
					}
				});
			}
			
		});
		return books;
		
	}catch(e){
		print(e);
		return null;
	}
}

Future<bool> postSellExchange(File file, String bookName, String action, UserDetails userDetails) async{
	String location;
	try{
		
		Reference ref = FirebaseStorage.instance.ref().child("BookSelf").child(bookName);
		await ref.putFile(file);
		location = await ref.getDownloadURL();
		
		FirebaseDatabase.instance.reference()
				.child("BookSelf")
				.child("Sell,Exc")
		    .push()
				.set({
			"bookName":bookName,
			"location": location,
			"action": action,
			"PostedBy": userDetails.userName,
		
		});
		
		return true;
	}catch(e){
		print("error");
		print(e);
		return false;
	}
}