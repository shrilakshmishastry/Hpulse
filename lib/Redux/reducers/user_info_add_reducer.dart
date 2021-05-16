import 'package:hpulse/Redux/actions/user_info_add_action.dart';
import 'package:hpulse/Redux/state/user_data_state.dart';


userInfoAddReducer(UserDataState prevData,UserInfoAddAction action){
  final payload = action.userDataState;
  print(prevData);
  print("reducer");
  return prevData.copyWith(
    loggedIn: payload.loggedIn,
    userInfo: payload.userInfo,
  );
}
