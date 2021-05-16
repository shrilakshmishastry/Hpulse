import 'package:dio/dio.dart';
import 'package:hpulse/Redux/model/h_news.dart';
import 'package:hpulse/Redux/state/h_news_state.dart';
import 'package:hpulse/Redux/store.dart';
import 'package:hpulse/config/ApiCalls/new_post_fetch.dart';
import 'package:hpulse/config/api.dart';
import 'package:redux/redux.dart';

class SetNewAction{
  final HNewsState newPost;
  SetNewAction(this.newPost);
}

Future<void> fetchNewPostAction(Store<AppState> store ) async{
  print("call");
  store.dispatch(
      SetNewAction(
    HNewsState(
      isNewLoading: true
    ),
  ));
  try{

   final response = await Dio().get(Api.baseUrl+Api.newStories);
   assert(response.statusCode == 200);
   print("response");
   print(response);
   final res = await newPostFetch(response.data.sublist(0,100));
   await store.dispatch(
       SetNewAction(
      HNewsState(
        isNewLoading: false,
        newStories: HNews.listFromJson(res),
      ),
   ));
  }catch(e){
    print(e);
    store.dispatch(
        SetNewAction(
          HNewsState(
              isNewError: true,
          ),
        ));
  }
}
