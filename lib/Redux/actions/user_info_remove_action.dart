import 'package:flutter/material.dart';
import 'package:hpulse/Redux/state/user_data_state.dart';

@immutable
class UserInfoRemoveAction{
  final UserDataState userInfo;
  UserInfoRemoveAction(this.userInfo);
}
