import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:hpulse/Redux/model/user_data.dart';

@immutable
class UserDataState{
  final bool loggedIn;
  final bool loginError;
  final UserData userInfo;
  final bool infoLoading;

  UserDataState({
   this. loggedIn = false,
    this.userInfo ,
    this.infoLoading = false,
    this.loginError = false
});

  factory UserDataState.initial() => UserDataState(
    loggedIn: false,
    userInfo: UserData(),
    infoLoading: false,
    loginError: false,
  );

UserDataState copyWith({
  @required bool loggedIn,
  @required UserData userInfo,
  @required bool loginError,
  @required bool infoLoading,
}){
  return UserDataState(
    loggedIn: loggedIn ?? this.loggedIn,
    userInfo: userInfo ?? this.userInfo,
    infoLoading: infoLoading ?? this.infoLoading,
    loginError: loginError ?? this.loginError,
  );
}

static UserDataState fromJson(dynamic  json){
  if(json != null){
    return UserDataState(
        loggedIn: json["loggedIn"],
        userInfo: UserData.listFromJson(json["userInfo"]),
        infoLoading: json["infoLoading"],
        loginError: json["loginError"],
    );
  }else{
    return UserDataState.initial();
  }
}

Map toJson() => {
  "loggedIn" : loggedIn,
  "userInfo" : userInfo.toJson(),
  "infoLoading" : infoLoading,
  "loginError": loginError,
};

}
