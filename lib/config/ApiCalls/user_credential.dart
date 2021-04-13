import 'package:dio/dio.dart';

// function to check user credential
Future<void> getHttp() async {
  print("hello here");

  try{
    final response =await Dio().get("https://news.ycombinator.com/login",
      queryParameters: {
        "goto":"news",
        "acct":'shrilakshmi',
        "pw": "shrilakshmi12",
      },
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    print(response.data.runtimeType);
  }catch(e){
    print(e);
  }
}
