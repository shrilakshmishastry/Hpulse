import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hpulse/DashBoard/ask_stories.dart';
import 'package:hpulse/DashBoard/new_stories.dart';
import 'package:hpulse/DashBoard/show_stories.dart';
import 'package:hpulse/DashBoard/top_stories.dart';
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
              body: Container(
                child: TabBarView(
                  children: [
                    TopStories(),
                    ShowStories(),
                    AskStories(),
                    NewStories(),
                  ],
                ),
              ),
            ),
          ),
        ),
    );
  }
}

