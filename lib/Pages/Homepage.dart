import 'package:flutter/material.dart';
import 'package:book_management/Other/background.dart';
import 'package:matrix4_transform/matrix4_transform.dart';
import 'package:book_management/Other/FirstLayer.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  double xoffSet = 0;
  double yoffSet = 0;
  double angle = 0;
  bool isOpen = false;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FirstLayer(),
          AnimatedContainer(
            transform: Matrix4Transform()
                .translate(x: xoffSet, y: yoffSet)
                .rotate(angle)
                .matrix4,
            duration: Duration(milliseconds: 200),
            child: SafeArea(
              child: Stack(
                children: [
                  backGround(context),
                  !isOpen
                      ? IconButton(
                      icon: Icon(
                        Icons.menu,
                        color:  Color(0xFF42210B),
                      ),
                      onPressed: () {
                        setState(() {
                          xoffSet = 150;
                          yoffSet = 80;
                          angle = -0.2;
                          isOpen = true;
                        });
                      })
                      : IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                          color:  Color(0xFF42210B)),
                      onPressed: () {
                        if (isOpen == true) {
                          setState(() {
                            xoffSet = 0;
                            yoffSet = 0;
                            angle = 0;
                            isOpen = false;
                          });
                        }
                      }),
                  Center(child: Text("jhgjutuuybuykuy")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
