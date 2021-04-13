import 'package:hpulse/Redux/actions/ask_action.dart';
import 'package:hpulse/Redux/actions/top_action.dart';
import 'package:hpulse/Redux/state/h_news_state.dart';

topReducer(HNewsState prevState,SetTopStoriesAction action){
  final payload = action.topState;
  return prevState.copyWith(
      isLoading: payload.isLoading,
      isError: payload.isError,
      topStories: payload.topStories,
  );
}
