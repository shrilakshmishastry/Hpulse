import 'package:hpulse/Redux/actions/show_action.dart';
import 'package:hpulse/Redux/state/h_news_state.dart';

showReducer(HNewsState prevState,SetShowAction action){
  final payload = action.showState;
  return prevState.copyWith(
      isShowLoading: payload.isShowLoading,
      isShowError: payload.isShowError,
      showStories: payload.showStories
  );
}
