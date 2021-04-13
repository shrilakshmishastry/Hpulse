import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hpulse/Redux/model/h_news.dart';
import 'package:hpulse/Redux/state/h_news_state.dart';
import 'package:hpulse/Redux/store.dart';
import 'package:hpulse/config/ApiCalls/ask_post_fetch.dart';
import 'package:hpulse/config/api.dart';
import 'package:redux/redux.dart';

@immutable
class SetTopStoriesAction{
  final HNewsState topState;
  SetTopStoriesAction(this.topState);
}

Future<void> fetchTopStoriesAction(Store<AppState> store) async{
  store.dispatch(
      SetTopStoriesAction(
          HNewsState(
            isLoading: true,
          )
      ));
  try{
    final  response = await Dio().get(Api.baseUrl+Api.topStories);
    assert(response.statusCode == 200);

    final res = await  askPostFetch(response.data);
    // print(res);
    await store.dispatch(
      SetTopStoriesAction(
        new
        HNewsState(
          topStories: HNews.listFromJson(res),
          isLoading: false,
        ),
      ),
    );

  }catch(e){
    print(e);
    store.dispatch(
        SetTopStoriesAction(
            HNewsState(
              isError: true,
            )
        )
    );
  }

}

