import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class BloodBankLoader extends StatefulWidget {
  final bool state;
  const BloodBankLoader({Key key,this.state}): super(key: key);

  @override
  _BloodBankLoaderState createState() => _BloodBankLoaderState();
}

class _BloodBankLoaderState extends State<BloodBankLoader> {
  void initState(){
    super.initState();
    Timer(
      Duration(seconds: 10),()=>Navigator.pop(context),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Center(
        child: Container(
          child: FlareActor(
            "images/bloodloader.flr",
            animation: widget.state?"run":"idle",
          ),
        ),
      )
    );
  }
}


class BookShelfLoader extends StatefulWidget {
  @override
  _BookShelfLoaderState createState() => _BookShelfLoaderState();
}

class _BookShelfLoaderState extends State<BookShelfLoader> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Center(
          child: Container(
            height: 180,
            width: 180,
            color: Colors.transparent,
            child: FlareActor(
              "images/bookshelfloader.flr",
              animation:"Go",
              fit: BoxFit.contain,
            ),
          ),
        )
    );
  }
}
