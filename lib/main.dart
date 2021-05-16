import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hpulse/Redux/actions/user_info_add_action.dart';
import 'package:hpulse/Redux/store.dart';
import 'package:hpulse/config/bottom_tab_app.dart';

import 'Redux/actions/ask_action.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Redux.init();
  runApp(HPulse());
}

class HPulse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: Redux.store,
        child: MaterialApp(

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
        ),
    );
  }
}

