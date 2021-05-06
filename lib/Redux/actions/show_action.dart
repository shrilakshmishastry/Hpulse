import 'package:dio/dio.dart';
import 'package:hpulse/Redux/model/h_news.dart';
import 'package:hpulse/Redux/state/h_news_state.dart';
import 'package:hpulse/config/ApiCalls/ask_post_fetch.dart';
import 'package:hpulse/config/api.dart';
import 'package:redux/redux.dart';
import '../store.dart';


class SetShowAction{
  final HNewsState showState ;
  SetShowAction(this.showState);
}

Future<void> fetchShowPostAction(Store<AppState> store)async{
  store.dispatch(SetShowAction(
    HNewsState(
      isShowLoading:true
    ),
  ));
  try{
    final response = await Dio().get(Api.baseUrl+Api.newStories);
    assert(response.statusCode == 200);
    final res = await askPostFetch(response.data.sublist(0,50));
    assert( res!= null);
    await store.dispatch(
      SetShowAction(
        HNewsState(
          showStories: HNews.listFromJson(res),
          isShowLoading: false,
        ),
      ),
    );
  }catch(e){
    print("new stories serror");
    store.dispatch(
      SetShowAction(
        HNewsState(
            isShowError: true
        ),
      ),
    );
  }
}
