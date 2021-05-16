class UserData{
  String id;
  dynamic created;
  dynamic karma;

  UserData();

  UserData.fromJson(Map<String, dynamic> data){
    if (data == null) return;
    id = data["id"];
    created = data["created"];
    karma = data["karma"];

  }

  static UserData listFromJson(dynamic data){
    return data == null ?  UserData()  : UserData.fromJson(data);
  }

  dynamic toJson(){
    return {
      "id": id,
      "created" : created,
      "karma" : karma,
    };
  }

}
