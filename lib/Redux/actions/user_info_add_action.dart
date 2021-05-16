import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hpulse/Redux/model/user_data.dart';
import 'package:hpulse/Redux/state/user_data_state.dart';
import 'package:hpulse/config/ApiCalls/user_credential.dart';
import 'package:redux/redux.dart';
import '../store.dart';
import 'package:hpulse/config/api.dart';

@immutable
class UserInfoAddAction {
  final UserDataState userDataState;

  UserInfoAddAction(this.userDataState);
}

Future<void> fetchUserInfoAction(Store<AppState> store) async {
  store.dispatch(UserInfoAddAction(
    UserDataState(
      infoLoading: true,
    ),
  ));
  try {
    final response = await getHttp();
    assert(response);
    final result = await Dio().get(Api.baseUrl+Api.userInfo+"shrilakshmi.json?print=pretty");
    print("inside action");
    print(UserData.listFromJson(result.data));
    await store.dispatch(
      UserInfoAddAction(
        UserDataState(
          infoLoading: false,
          userInfo: UserData.listFromJson(result.data),
          loggedIn: true,
        ),
      ),
    );

  } catch (e) {
    print(e);
    store.dispatch(
      UserInfoAddAction(
        UserDataState(
          loginError: true,
          infoLoading: false,
        ),
      )
    );
  }
}
