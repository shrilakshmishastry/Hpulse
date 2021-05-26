import 'package:flutter/material.dart';
import 'package:hpulse/Profile/alert_box.dart';
import 'package:hpulse/config/theme/sizes_helper.dart';
import 'package:hpulse/config/theme/style.dart';

//class to show widget if user hasn't logged in
class LogIn extends StatelessWidget {

  Future<void> _showDialog(context) async {
    // String _name;
    // String _password;
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertBoxCustom();
        });

  }

  @override
  Widget build(BuildContext context) {
    double width = setWidth(context);
    double height = setHeight(context);
    return   SizedBox(
      width: width > height ? width : height,
      child: Card(
        color: Style.primary,
        margin: EdgeInsets.only(
            bottom: width * 0.04,
          top: width * 0.04,
          left: width * 0.02,
          right:  width * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Text(
                "Hpulse",
                style: TextStyle(
                  color: Style.white,
                  fontSize: Style.text_xl,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Icon(
                Icons.flag,
                color: Style.white,
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  left:  width * 0.04
                ),
              child: Text(
                  "Sync to your Hacker News account !!",
                   style: TextStyle(
                     color: Style.white,
                   ),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(
                width * 0.05
              ),
             dense: true,
              leading:  TextButton(
                style:TextButton.styleFrom(
                  backgroundColor: Style.white,
                  padding: EdgeInsets.only(
                    left: width * 0.09,
                    right: width * 0.09,
                  )
                ),
                onPressed: (){
                  _showDialog(context);
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Style.primary,
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
