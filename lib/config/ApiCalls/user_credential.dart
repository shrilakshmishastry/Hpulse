import 'package:dio/dio.dart';

// function to check user credential
Future<dynamic> getHttp(String name,String password) async {
  print("hello here");

  try{
    final response =await Dio().get("https://news.ycombinator.com/login",
      queryParameters: {
        "goto":"news",
        "acct": name,
        "pw": password,
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    assert(! response.data.contains('Bad login'));
    return !response.data.contains('Bad login');
  }catch(e){
    print(e);
    return false;
  }
}
