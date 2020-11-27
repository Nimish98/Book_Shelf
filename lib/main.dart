import 'package:book_management/Pages/Homepage.dart';
import 'package:book_management/Pages/Loginsignup.dart';
import 'package:flutter/material.dart';
import 'dart:async';
// import 'package:boo';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginSignUp(),
      debugShowCheckedModeBanner: false,
    );
  }
}
// class Splash extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     return SplashState();
//   }
// }
// class SplashState extends State<Splash>{
//   void initState() {
//     super.initState();
//     Timer(Duration(seconds: 5),() => {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) =>LoginSignUp()),
//       )
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Image(
//             image: AssetImage("images/SplashBackground.jpg"),
//             fit: BoxFit.cover,
//             color: Colors.black45,
//             colorBlendMode: BlendMode.darken,
//           ),
//          Column(
//            children: <Widget>[
//              SizedBox(
//                height: 30.0,
//              ),
//              CircleAvatar(
//                radius: 110,
//                backgroundColor: Colors.transparent,
//                child: Icon(Icons.library_books,
//                  size: 220,),
//              ),
//              SizedBox(
//                height: 30.0,
//              ),
//              Text(
//                "Book Shelf",
//                style: TextStyle(fontSize: 70,fontFamily: "Greatvibes",color: Colors.white,fontWeight: FontWeight.bold),
//              ),
//              Text("More than a book store",
//              style: TextStyle(fontSize: 14,color: Colors.white,fontFamily: "Courgette"),
//              ),
//
//            ],
//          )
//         ],
//       ),
//     );
//   }
// }