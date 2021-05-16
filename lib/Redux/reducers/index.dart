import 'package:hpulse/Redux/actions/ask_action.dart';
import 'package:hpulse/Redux/actions/new_action.dart';
import 'package:hpulse/Redux/actions/show_action.dart';
import 'package:hpulse/Redux/actions/top_action.dart';
import 'package:hpulse/Redux/actions/user_info_add_action.dart';
import 'package:hpulse/Redux/actions/user_info_remove_action.dart';
import 'package:hpulse/Redux/reducers/ask_reducer.dart';
import 'package:hpulse/Redux/reducers/new_reducer.dart';
import 'package:hpulse/Redux/reducers/show_reducer.dart';
import 'package:hpulse/Redux/reducers/top_reducer.dart';
import 'package:hpulse/Redux/reducers/user_info_add_reducer.dart';
import 'package:hpulse/Redux/reducers/user_infor_remove_reducer.dart';
import 'package:hpulse/Redux/store.dart';

AppState appReducer(AppState state,dynamic action){
  // print(action.askState.ask);
  print(action is UserInfoAddAction);

  if(action is UserInfoAddAction){
    final nextState = userInfoAddReducer(state.userData, action);
    return state.copyWith(userData: nextState);
  }
  if(action is UserInfoRemoveAction){
    final nextState = userInfoRemoveReducer(state.userData, action);
    return state.copyWith(userData: nextState);
  }
  if(action is SetAskAction){
    final nexState = askReducer(state.news, action);
    return state.copyWith(news: nexState);
  }
  else if(action is SetNewAction){
    final nextState = newPostReducer(state.news, action);
    return state.copyWith(news: nextState);
  }
  else if(action is SetShowAction){
    final nextState = showReducer(state.news, action);
    return state.copyWith(news: nextState);
  }
  else if(action is SetTopStoriesAction){
    final nextState = topReducer(state.news, action);
    return state.copyWith(news: nextState);
  }
  return state;
}
