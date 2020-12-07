import 'package:flutter/material.dart';




class OpeningScreen extends StatefulWidget {
  @override
  _OpeningScreenState createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
	
	
  @override
  Widget build(BuildContext context) {
    return Scaffold(
	    body: Container(
		    decoration: BoxDecoration(
			    image: DecorationImage(
				    image: AssetImage("Assets/3025.jpg"),
				    fit: BoxFit.fitHeight
			    )
		    ),
		    
		    // child: Column(
				//     children: [
				//     	FlatButton(
				// 		    child: Text("SignUp"),
				// 		    onPressed: (){
		    //
				// 		    },
				// 	    )
				//     ],
		    //   ),
	    ),
    );
  }
}
