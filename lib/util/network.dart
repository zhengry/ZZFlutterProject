
import 'package:dio/dio.dart';


enum RequestMethod { GET, POST }

class Network {

// get请求
static Future getFor(String url,{Map paras}) async {
    try {
      Dio dio = Dio();
      // dio.options.contentType = ContentType.parse('application/json');
      Response response;
      if (paras == null) {
        response = await dio.get(url);
      } else {
        response = await dio.get(url, queryParameters: paras);
      }  
      print('response================>${response.toString()}');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('接口异常url--------->$url');
      }
    } catch (error) {
       print('请求出错error--------->$error');
       throw error;
    }
  }

// post请求
static Future postFor(String url,Map paras) async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.post(url, queryParameters: paras);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('接口异常url--------->$url');
      }
    } catch (error) {
     print('请求出错error--------->$error');
      throw error;
    }
  }

   
}

//   static Future<Map> _get(String url, {Map paras}) async {
//     //  _request(Options(method: 'GET'), url, paras: paras);
//     try {
//       Dio dio = Dio();
//       Response response = await dio.get(url,queryParameters:paras);
//       if (response.statusCode == 200) {
//         return response.data;
//       } else {
//         throw Error();
//       }
//     } catch (error) {
//       throw error;
//     }
//   }

//   static _post(String url, {Map paras}) async {
//     return await _request(Options(method: 'POST'), url, paras: paras);
//   }

//   static _request(Options method, String url, {Map paras}) async {
//     try {
//       Dio dio = Dio();
//       Response response = await dio.request(url, data: paras, options: method);
//       if (response.statusCode == 200) {
//         return (response.data["result"] as List).cast();
//       } else {
//         throw Error();
//       }
//     } catch (error) {
//       throw error;
//     }
//   }

//   static Future<List<Map>> loadChannelList() async {
//     var result = await _get(URLManager.channelList);
//     return (result['result'] as List).cast();
//   }

//   static Future loadChannelDetail(Map paras) async {
//     return _get(URLManager.channelDetail, paras: paras);
//   }
// }
