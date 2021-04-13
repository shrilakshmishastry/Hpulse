import 'package:hpulse/Redux/actions/ask_action.dart';
import 'package:hpulse/Redux/state/h_news_state.dart';

askReducer(HNewsState prevState,SetAskAction action){
  final payload = action.askState;
  return prevState.copyWith(
      isLoading: payload.isLoading,
      isError: payload.isError,
      ask: payload.ask
  );
}
