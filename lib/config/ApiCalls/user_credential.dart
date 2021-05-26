import 'package:dio/dio.dart';

// function to check user credential
Future<dynamic> getHttp(String name,String password) async {

  try{
    final response =await Dio().get("https://news.ycombinator.com/login",
      queryParameters: {
        "goto":"news",
        "acct": name,
        "pw": password,
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    print(response.data);
    print(response.data.contains('Bad Login'));
    assert( !response.data.contains('Bad login'));
    return ! response.data.contains('Bad login');
  }catch(e){
    print(e);
    return false;
  }
}
