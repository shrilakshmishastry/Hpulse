import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hpulse/Redux/reducers/index.dart';
import 'package:hpulse/Redux/state/h_news_state.dart';
import 'package:hpulse/Redux/state/user_data_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux_persist/redux_persist.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'package:redux_thunk/redux_thunk.dart';

@immutable
class AppState {
  final HNewsState news;
  final UserDataState userData;

  AppState({this.news , this.userData  });

  AppState copyWith({HNewsState news,UserDataState userData}) {
    return AppState(
      news: news ?? this.news,
      userData: userData ?? this.userData
    );
  }

  factory AppState.initial()=> AppState(
      userData: UserDataState.initial(),
  );

  static AppState fromJson(dynamic json){

   if(json != null){
      print(UserDataState.fromJson(json["userData"]));
     return new AppState(userData: UserDataState.fromJson(json["userData"]));
   }else{
     return AppState.initial();
   }
  }

  dynamic toJson(){
    return{
      "userData" : userData.toJson()
    };
  }
}

class Redux {
  static Store<AppState> _store;

  static Store<AppState> get store {
    if (_store == null) {
      throw Exception("store is empty");
    } else {
      return _store;
    }
  }

  static Future<void> init() async {

    final persistor = Persistor<AppState>(
        storage: FlutterStorage(),
        serializer: JsonSerializer<AppState>(AppState.fromJson),
      debug: true,
    );

    final initialState =await persistor.load();

    _store = Store<AppState>(appReducer,
        middleware: [
          thunkMiddleware,
          persistor.createMiddleware(),
          new LoggingMiddleware.printer()
        ],

        initialState:  AppState(
            news: HNewsState.initial(),userData: initialState.userData
        ),
    );
  }
}
