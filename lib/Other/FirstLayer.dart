import 'package:flutter/material.dart';
class FirstLayer extends StatelessWidget {
  final Color primary = Color.fromRGBO(242, 180, 120, 0.7);
  final TextStyle style = TextStyle(
    color: Color(0xFF42210B),
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children:[
            Ink(
              decoration: BoxDecoration(
                color: Color.fromRGBO(251, 176, 59, 0.75),
              ),
            ),
            Positioned(
              top: -100.0,
              left: 100.0,
              child: Transform.rotate(
                angle: -0.5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: primary.withOpacity(0.5),
                  ),
                  width: 150,
                  height: 300,
                ),
              ),
            ),
            Positioned(
              bottom: -120.0,
              right: 90.0,
              child: Transform.rotate(
                angle: -0.8,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: primary.withOpacity(0.5),
                  ),
                  width: 150,
                  height: 300,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Color(0xFF8C6239),
                            borderRadius: BorderRadius.circular(50.0)
                        ),
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              image: DecorationImage(
                                image: AssetImage("images/icon.png"),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: (){},
                      splashColor: primary,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Feed",
                          style: style,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: (){},
                      splashColor: primary,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Activities",
                          style: style,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: (){},
                      splashColor: primary,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Blood Bank",
                                style: style,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: (){},
                      splashColor: primary,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Settings",
                          style: style,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    InkWell(
                      onTap: (){},
                      splashColor: primary,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "Help",
                          style: style,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
