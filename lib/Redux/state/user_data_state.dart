import 'package:flutter/cupertino.dart';
import 'package:hpulse/Redux/model/user_data.dart';

@immutable
class UserDataState{
  final bool loggedIn;
  final UserData userInfo;
  final bool infoLoading;

  UserDataState({
   this. loggedIn = false,
    this.userInfo,
    this.infoLoading = false
});

UserDataState copyWith({
  @required bool loggedIn,
  @required UserData userInfo

}){
  return UserDataState(
    loggedIn: loggedIn ?? this.loggedIn,
    userInfo: userInfo ?? this.userInfo,
  );
}


}
