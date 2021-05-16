import 'package:hpulse/Redux/actions/top_action.dart';
import 'package:hpulse/Redux/state/h_news_state.dart';

topReducer(HNewsState prevState,SetTopStoriesAction action){
  final payload = action.topState;
  return prevState.copyWith(
      isTopLoading: payload.isTopLoading,
      isTopError: payload.isTopError,
      topStories: payload.topStories,
  );
}
