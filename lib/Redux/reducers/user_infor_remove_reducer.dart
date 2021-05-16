
import 'package:hpulse/Redux/actions/user_info_remove_action.dart';
import 'package:hpulse/Redux/state/user_data_state.dart';

userInfoRemoveReducer(UserDataState prevState,UserInfoRemoveAction action){
  final payload = action.userInfo;
  print(payload);
  print(prevState);
  return prevState.copyWith(
      loggedIn: payload.loggedIn,
      userInfo: payload.userInfo,
      loginError: payload.loginError,
  );
}
