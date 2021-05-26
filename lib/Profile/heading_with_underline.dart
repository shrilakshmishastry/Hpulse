import 'package:flutter/material.dart';
import 'package:hpulse/config/theme/sizes_helper.dart';
import 'package:hpulse/config/theme/style.dart';
class HeadingWithUnderLine extends StatelessWidget {

  final String content ;
  HeadingWithUnderLine(this.content);

  @override
  Widget build(BuildContext context) {
    double width = setWidth(context);
    double height = setHeight(context);
    return   Container(
      margin: EdgeInsets.only(bottom: width * 0.05),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Text(
            content,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: Style.text_lg,
              color: Style.primary,
            ),
          ),
        ],
      ),
      padding: EdgeInsets.only(
        top: height * 0.01,
        bottom: height * 0.01,
        left: height * 0.02,
      ),
      decoration: BoxDecoration(
        color: Style.gray,
          border: Border(
            bottom: BorderSide(
                color: Style.gray, width: width * 0.006),
          )),
    );
  }
}
