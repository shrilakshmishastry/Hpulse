import 'package:flutter/material.dart';
import 'package:hpulse/config/theme/sizes_helper.dart';
import 'package:hpulse/config/theme/style.dart';
class HeadingWithUnderLine extends StatelessWidget {

  final String content ;
  HeadingWithUnderLine(this.content);

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.only(bottom: getWidth(context) * 0.05),
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
        top: getHeight(context) * 0.01,
        bottom: getHeight(context) * 0.01,
        left: getHeight(context) * 0.02,
      ),
      decoration: BoxDecoration(
        color: Style.gray,
          border: Border(
            bottom: BorderSide(
                color: Style.gray, width: getWidth(context) * 0.006),
          )),
    );
  }
}
