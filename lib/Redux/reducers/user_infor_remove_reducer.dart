import 'package:hpulse/Redux/actions/user_info_remove_action.dart';
import 'package:hpulse/Redux/model/user_data.dart';
import 'package:hpulse/Redux/state/user_data_state.dart';

userInfoRemoveReducer(UserDataState prevState,UserInfoRemoveAction action){
  print(prevState);
  return prevState.copyWith(
      loggedIn: false,
      userInfo: UserData(),
      loginError: false,
  );
}
