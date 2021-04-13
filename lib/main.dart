import 'package:flutter/material.dart';
import 'package:hpulse/Redux/store.dart';
import 'package:hpulse/config/bottom_tab_app.dart';

void main() async{
  await Redux.init();
  runApp(HPulse());
}

class HPulse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Lato2OFL',
      ),
      title: 'HPulse',
      routes: <String,WidgetBuilder>{
        "/home": (BuildContext context)=>new BottomTabApp(),
        "/land" :(BuildContext context)=>new Text("land"),
      },
      initialRoute: "/home",
      home: new BottomTabApp(),
    );
  }
}

