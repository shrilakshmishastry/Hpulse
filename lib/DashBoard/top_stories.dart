import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hpulse/Redux/actions/ask_action.dart';
import 'package:hpulse/Redux/actions/top_action.dart';
import 'package:hpulse/Redux/model/h_news.dart';
import 'package:hpulse/Redux/store.dart';
class TopStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        StoreConnector<AppState,List<HNews>>
          (
            converter: (store)=>store.state.news.ask,
            builder: (context,topStories){
              print(topStories);
              return Text("hello");

            }

        ),
        StoreConnector<AppState,bool>
          (

            converter: (store)=>store.state.news.isLoading,
          builder: (context,isLoading){
              if(isLoading){
                return CircularProgressIndicator();
              }
              else{
                return SizedBox.shrink();
              }
          },
        ),
      ],
    );


  }
}
