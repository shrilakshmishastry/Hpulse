import 'package:dio/dio.dart';
import 'package:hpulse/config/api.dart';

Future<dynamic> fetchItem(int ele) async{
  final res = await Dio().get(Api.baseUrl+Api.item+"/"+ele.toString()+".json");
  return res.data;
}

Future<dynamic> newPostFetch(List<dynamic> data)async{
  List<dynamic> response = [];
  print(data.length);
  await Future.forEach(data, (element) async{
    response.add(await fetchItem(element));
  });
  return response;
}
