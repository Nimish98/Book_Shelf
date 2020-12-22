import 'package:flutter/material.dart';
InputDecoration inputDecoration({String hintText}){
  return InputDecoration(
    focusColor: Colors.black,
    border: InputBorder.none,
    contentPadding: EdgeInsets.symmetric(
      vertical: 17.0,
      horizontal:26,
    ),
    hintText:hintText,
    hintStyle: TextStyle(color: Color(0xFF42210B),fontSize: 16),
    fillColor: Color(0xFFC69C6D),
    filled: false,
  );
}
dialog(BuildContext context){
  return AlertDialog(
    backgroundColor: Color.fromRGBO(242, 180, 125, 1),
    title: Text("Book Alert",style: TextStyle(fontSize: 20,color:Color(0xFF42210B),fontWeight: FontWeight.bold),),
    content: Text("Currently we are offering only DIGITAL copies of the books, soon will be coming with PAPERBACK copies, we hope you co-operate.",style: TextStyle(height:1.2,fontSize: 19,color:Color(0xFF42210B),fontWeight: FontWeight.w300),),
    actions: [
      FlatButton(
        child: Text("OK",style: TextStyle(fontSize: 20,color:Color(0xFF42210B),fontWeight: FontWeight.bold)),
        onPressed: () {
          Navigator.of(context).pop();
          // Navigator.pop(context);
        },
      ),
    ],
  );
}