import 'package:hpulse/Redux/actions/new_action.dart';
import 'package:hpulse/Redux/state/h_news_state.dart';

newPostReducer(HNewsState prevState,SetNewAction action){
  final payload = action.newPost;
  return prevState.copyWith(
      isNewLoading: payload.isNewLoading,
      isNewError: payload.isNewError,
      newStories: payload.newStories,
  );
}
