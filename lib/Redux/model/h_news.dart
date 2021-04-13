class HNews{
  int id;
  String title;
  String type;
  String text;
  int descendants;
  List<dynamic> kids;
  int score;
  int time;
  String url;
  String by;

  HNews.fromJson(Map<String,dynamic> json){
    if(json == null) return;
    id = json["id"];
    title = json["title"];
    time = json["time"] == null ? "" : json["time"];
    by = json["by"] ==  null ? "" : json["by"];
    text = json["text"];
    score = json["score"] == null ? 0 : json["score"];
    descendants = json["descendants"] == null ? [] : json["descendants"];
    kids = json["kids"] == null ? []: json["kids"];
  }

  static List<dynamic> listFromJson(List<dynamic> json){
    return json == null ? <HNews>[] : json.map((e) =>HNews.fromJson(e)).toList();
}
}
