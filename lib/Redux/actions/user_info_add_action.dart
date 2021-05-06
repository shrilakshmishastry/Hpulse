import 'package:flutter/cupertino.dart';
import 'package:hpulse/Redux/state/user_data_state.dart';

@immutable
class UserInfoAddAction{
  final UserDataState userDataState;
  UserInfoAddAction(this.userDataState);
}


