import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hpulse/Redux/actions/user_info_add_action.dart';
import 'package:hpulse/Redux/state/user_data_state.dart';
import 'package:hpulse/Redux/store.dart';
import 'package:hpulse/config/bottom_tab_app.dart';

import 'Redux/actions/ask_action.dart';
import 'Redux/actions/new_action.dart';
import 'Redux/actions/show_action.dart';
import 'Redux/actions/top_action.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Redux.init();
  Redux.store.dispatch(fetchAskPostAction);
  Redux.store.dispatch(fetchShowPostAction);
  Redux.store.dispatch(fetchNewPostAction);
  Redux.store.dispatch(fetchTopStoriesAction);
  Redux.store.dispatch(UserInfoAddAction(
    UserDataState(
      loginError: false
    )
  ));
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

