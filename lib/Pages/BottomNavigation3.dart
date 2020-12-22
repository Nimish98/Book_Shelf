import 'package:flutter/material.dart';
import 'package:book_management/Other/background.dart';

class Organisation extends StatefulWidget {
  @override
  _OrganisationState createState() => _OrganisationState();
}

class _OrganisationState extends State<Organisation> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backGround(context),
        Image.asset(
            "images/org.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
