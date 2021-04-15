import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hpulse/Redux/model/h_news.dart';
import 'package:hpulse/Redux/state/h_news_state.dart';
import 'package:hpulse/Redux/store.dart';
import 'package:hpulse/config/ApiCalls/ask_post_fetch.dart';
import 'package:hpulse/config/api.dart';
import 'package:redux/redux.dart';

@immutable
class SetAskAction{
  final HNewsState askState;
  SetAskAction(this.askState);
}

Future<void> fetchAskPostAction(Store<AppState> store) async{
  store.dispatch(
      SetAskAction(
        HNewsState(
          isLoading: true,
        )
      ));
  try{
    final  response = await Dio().get(Api.baseUrl+Api.ask);
    assert(response.statusCode == 200);

    final res = await  askPostFetch(response.data);
    await store.dispatch(
      SetAskAction(
        new
        HNewsState(
          ask: HNews.listFromJson(res),
          isLoading: false,
        ),
      ),
    );

  }catch(e){
    print(e);
    store.dispatch(
      SetAskAction(
        HNewsState(
          isError: true,
        )
      )
    );
  }

}

