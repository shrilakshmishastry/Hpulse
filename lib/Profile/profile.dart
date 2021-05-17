import 'package:flutter/material.dart';
import 'package:hpulse/Profile/content.dart';
import 'package:hpulse/config/theme/style.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: Colors.white,
          elevation: 0,
          backgroundColor: Style.white,
          automaticallyImplyLeading: false,
          title: Text(
            "Profile",
            style: TextStyle(color: Style.primary, fontWeight: FontWeight.w800),
          ),
        ),
        body: ListView(
          children: [
            Content(),
          ],
        ),
      ),
    );
  }
}
