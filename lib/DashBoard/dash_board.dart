import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:hpulse/DashBoard/sliver_app_bar_delegate.dart';
import 'package:hpulse/DashBoard/top_stories.dart';
import 'package:hpulse/Redux/actions/ask_action.dart';
import 'package:hpulse/Redux/model/h_news.dart';
import 'package:hpulse/Redux/store.dart';
import 'package:hpulse/config/theme/sizes_helper.dart';
import 'package:hpulse/config/theme/style.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = getHeight(context);
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Color(0xffffffff),
    //   systemNavigationBarIconBrightness: Brightness.dark,
    // )
    //
    // );
    final TextStyle labelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      fontSize: Style.text_md,
    );

    return SafeArea(
        child:Scaffold(
          body:DefaultTabController(
            length: 4,
            child:  NestedScrollView(
              headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
                return <Widget>[
                  SliverAppBar(
                    backgroundColor: Style.white,
                    foregroundColor: Style.white,
                    brightness: Brightness.light,
                    automaticallyImplyLeading: false,
                    expandedHeight: height * 0.1,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(
                        "title",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),

                  ),
                  SliverAppBar(
                    pinned: true,
                    collapsedHeight: height*0.03,
                    toolbarHeight: height*0.01,
                    expandedHeight: height*0.01,
                    backgroundColor: Style.white,
                    foregroundColor: Style.white,
                    brightness: Brightness.light,
                    automaticallyImplyLeading: false,
                    bottom:TabBar(
                      indicatorWeight: 3.0,
                      labelStyle: labelStyle,
                      indicatorColor: Style.danger,
                      labelColor: Style.primary,
                      unselectedLabelColor: Style.primary,
                      tabs: [
                        Tab(
                          text: "Top",
                        ),
                        Tab(
                          text: "Show",
                        ),
                        Tab(
                          text: "Ask",
                        ),
                        Tab(
                          text: "New",
                        ),
                      ],
                    ),
                  ),

                ];
              },
              body: StoreConnector<AppState,AppState>
                (
                  onInit: (store) {Redux.store.dispatch(fetchAskPostAction);
                  },
                  converter: (store)=>store.state,
                  builder: (context,topStories){

                    return TabBarView(
                      children: [
                        TopStories(),
                        Center(
                          child: Text("hello"),
                        ),
                        Center(
                          child: Text("hello"),
                        ),
                        Center(
                          child: Text("hello"),
                        ),
                      ],
                    );

                  }

              ),
            ),
          ),
        ),
    );
  }
}

