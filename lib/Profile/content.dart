import 'package:flutter/material.dart';
import 'package:hpulse/Profile/about.dart';
import 'package:hpulse/config/theme/sizes_helper.dart';

import 'button_link.dart';
import 'heading_with_underline.dart';
class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = getWidth(context);
    return Container(
      margin: EdgeInsets.only(left: width * 0.02,right: width*0.02),
      child: Column(
        children: [
          Text("profile details here"),
          HeadingWithUnderLine("Links"),
          Button("Home page" , "https://flutter.dev"),
          Button("List" , "https://flutter.dev"),
          Button("Jobs" , "https://flutter.dev"),
          Button("Guidelines" , "https://flutter.dev"),
          Button("FAQ" , "https://flutter.dev"),
          Button("Contact" , "https://flutter.dev"),
          HeadingWithUnderLine("About"),
          About(),
        ],
      ),
    );
  }
}
