import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
backGround(BuildContext context){
  return SafeArea(
    child: Container(
      color: Color.fromRGBO(242, 180, 120, 1),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  "images/1.png",
                height: 120,
                width: 120,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                  "images/2.png",
                height: 110,
                width: 110,
              ),
              Image.asset(
                "images/4.png",
                height: 110,
                width: 110,
              ),
              Image.asset(
                  "images/3.png",
                height: 110,
                width: 110,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "images/5.png",
                height: 110,
                width: 110,
              ),
              Image.asset(
                "images/6.png",
                height: 110,
                width: 110,
              ),
              Image.asset(
                "images/2.png",
                height: 110,
                width: 110,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "images/1.png",
                height: 110,
                width: 110,
              ),
              Image.asset(
                "images/8.png",
                height: 110,
                width: 110,
              ),
              Image.asset(
                "images/9.png",
                height: 110,
                width: 110,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "images/10.png",
                height: 110,
                width: 110,
              ),
              Image.asset(
                "images/11.png",
                height: 110,
                width: 110,
              ),
              Image.asset(
                "images/1.png",
                height: 110,
                width: 110,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "images/12.png",
                height: 110,
                width: 110,
              ),
              Image.asset(
                "images/1.png",
                height: 110,
                width: 110,
              ),
              Image.asset(
                "images/13.png",
                height: 110,
                width: 110,
              ),
            ],
          ),
        ],
      ),
    ),
  );
}