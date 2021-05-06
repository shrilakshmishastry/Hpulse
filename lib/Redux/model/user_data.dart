class UserData{
  int id;
  dynamic created;
  dynamic karma;

  UserData.fromJson(Map<String, dynamic> data){
    if (data == null) return;
    id = data["id"];
    created = data["created"];
    karma = data["karma"];

  }

  static List<UserData> listFromJson(List<dynamic> data){
    return data == null ? <UserData>[] : data.map((value)=>UserData.fromJson(value)).toList();
  }
}
