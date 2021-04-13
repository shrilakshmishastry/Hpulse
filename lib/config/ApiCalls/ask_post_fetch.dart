import 'package:dio/dio.dart';
import 'package:hpulse/config/api.dart';

Future<dynamic> fetchItem(int ele) async{
  final result = await Dio().get(Api.baseUrl+ Api.item+"/" +ele.toString()+".json");
  return result.data;
}

Future<dynamic> askPostFetch(List<dynamic> res) async {
     List<dynamic> response = [];
    await Future.forEach(res, (element) async {
       response.add(await fetchItem(element));
    }
    );
   return response;
}
