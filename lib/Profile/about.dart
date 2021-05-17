import 'package:flutter/material.dart';
import 'package:hpulse/config/theme/sizes_helper.dart';
import 'package:hpulse/config/theme/style.dart';
class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = getWidth(context);
    return   Container(
      padding: EdgeInsets.all(width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Version 1.0.0",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black38,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: width * 0.05,
            ),
            child:   Row(
              children: [
                Container(
                  child: Text("App built with"),
                  margin: EdgeInsets.only(
                    right: width * 0.01,

                  ),
                ),
                Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                Container(
                  child: Text("by Shrilakshmi"),
                  margin: EdgeInsets.only(left: width * 0.01),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
