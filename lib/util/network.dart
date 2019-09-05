import 'package:dio/dio.dart';



class Network{
  static String baseUrl = 'https://api.apiopen.top';
  static String channelListUrl = '';
  static String channelDetailUrl = '/musicRankingsDetails';

  static const contentTypeJson = 'Application/json';
  static const contentTypeForm = 'Application/x-www-form-urlencoded';


  static _get(String url,{Map paras}) async {
    return await _request(Options(method: 'GET'),url,paras: paras);
  }

  static _post(String url,{Map paras}) async {
    return await _request(Options(method: 'POST'),url,paras: paras);
  }


  static _request(Options method,String url,{Map paras}) async {
    Dio dio = Dio();
    Response response = await dio.request(url,data:paras,options:method);
    print(response.data.toString());
    return response;
    
  }

  static loadChannelDetail(Map paras){
    String url = baseUrl + channelDetailUrl;
    return _get(url,paras: paras);
  }

  


}