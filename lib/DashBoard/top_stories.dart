import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hpulse/DashBoard/builder_stories.dart';
import 'package:hpulse/Redux/model/h_news.dart';
import 'package:hpulse/Redux/store.dart';
import 'package:hpulse/config/theme/sizes_helper.dart';

class TopStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Padding(
        padding:EdgeInsets.all(getHeight(context)*0.01),
      child: Column(
        children: [
          StoreConnector<AppState,bool>(
            converter: (store) =>store.state.news.isTopError,
            builder: (context,isTopError){
              if(isTopError){
                return Text("Error");
              }else{
                return SizedBox.shrink();
              }
            },

          ),

          StoreConnector<AppState,bool>
            (
            converter: (store)=>store.state.news.isTopLoading,
            builder: (context,isLoading){
              if(isLoading){
                return CircularProgressIndicator();
              }else{
                return SizedBox.shrink();
              }
            },

          ),
          Expanded(
            child: StoreConnector<AppState,List<HNews>>
              (
              converter: (store)=>store.state.news.topStories,
              builder: (context,topStories){
                print(topStories);
                return ListView(
                  children: BuilderStroies.buildStories(topStories,context),
                );
              },

            ),
          ),
       ]
      ),
    );


  }
}
