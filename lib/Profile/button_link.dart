import 'package:flutter/material.dart';
import 'package:hpulse/config/theme/sizes_helper.dart';
import 'package:hpulse/config/theme/style.dart';
import 'package:url_launcher/url_launcher.dart';

class Button extends StatelessWidget {

  final String innerContent;
  final String url;
   Button(this.innerContent,this.url);

  void handlePress(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
      );
    } else {
      throw 'Could not lunch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    double width = getWidth(context);
    return ListTile(
      autofocus: true,
      onTap: ()=>handlePress(url),
      leading: Text(
          innerContent,
          style: TextStyle(
            fontSize: Style.text_md,
          ),
      ),
      trailing: Icon(
          Icons.chevron_right,
        size: Style.text_xx_lg,
        color: Style.dark,
      ),
    );


  }
}
