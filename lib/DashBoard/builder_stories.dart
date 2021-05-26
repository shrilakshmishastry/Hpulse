import 'package:flutter/material.dart';
import 'package:hpulse/Redux/model/h_news.dart';
import 'package:hpulse/config/theme/sizes_helper.dart';
import 'package:hpulse/config/theme/style.dart';
import 'package:intl/intl.dart';

class BuilderStroies {
  static TextStyle title = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: Style.text_sm,
  );

  static TextStyle by = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: Style.text_x_sm,
  );

  static List<Widget> buildStories(List<HNews> post, BuildContext context) {
    double height = setHeight(context);
    double width = setWidth(context);
    return post.map((e) {
      return (Card(
        child: Column(
          key: Key(e.id.toString()),
          children: [
            // ListTile(
            //   leading: Text("hello"),
            //   title: Column(
            //       children: [
            //         Text(e.by)
            //       ]
            //   ),
            //   trailing: Text(
            //     DateFormat.yMd().format(DateTime.fromMillisecondsSinceEpoch(e.time)),
            //     textAlign: TextAlign.start,
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(height * 0.01),
                  child: Row(
                    children: [
                      // Container(
                      //   padding: EdgeInsets.all(getWidth(context)*0.01),
                      //   width: getWidth(context) * 0.08,
                      //   height: getHeight(context) * 0.039,
                      //   child: Text(
                      //     e.by[0].toUpperCase(),
                      //     textAlign: TextAlign.center,
                      //     style: title,
                      //     softWrap: true,
                      //   ),
                      //   decoration: BoxDecoration(
                      //       color: Style.ternary,
                      //       shape: BoxShape.circle
                      //   ),
                      // ),
                      CircleAvatar(
                        backgroundColor: Style.ternary,
                        child: e.by[0] != null
                            ? Text(e.by[0].toUpperCase())
                            : Text("U"),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.04, top: width * 0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              e.by + "  " + "posted ",
                              style: by,
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    DateFormat.yMMMd().format(
                        DateTime.fromMillisecondsSinceEpoch(e.time * 1000)),
                    textAlign: TextAlign.start,
                    style: by,
                  ),
                ),
              ],
            ),
            Container(
              child: Text(
                e.title,
                style: title,
                textAlign: TextAlign.start,
                softWrap: true,
              ),
              alignment: Alignment.topLeft,
              margin: EdgeInsets.all(height * 0.01),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(height * 0.01),
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: height * 0.03,
                        ),
                        SizedBox(
                          width: height * 0.01,
                        ),
                        Text(
                          e.descendants.toString(),
                          style: by,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(height * 0.01),
                    child: Row(
                      children: [
                        Icon(
                          Icons.thumb_up,
                          color: Style.primary,
                          size: height * 0.03,
                        ),
                        SizedBox(
                          width: height * 0.01,
                        ),
                        Text(
                          e.score.toString(),
                          style: by,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
    }).toList();
  }
}
