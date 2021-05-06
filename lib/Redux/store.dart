import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hpulse/Redux/reducers/index.dart';
import 'package:hpulse/Redux/state/h_news_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

@immutable
class AppState {
  final HNewsState news;

  AppState({@required this.news});

  AppState copyWith({@required HNewsState news}) {
    return AppState(news: news ?? this.news);
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
    print("param");
    final initialState = HNewsState();
    _store = Store<AppState>(appReducer,
        middleware: [thunkMiddleware],
        initialState: AppState(news: initialState));
  }
}
