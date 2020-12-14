import 'package:book_management/Class/Books.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

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