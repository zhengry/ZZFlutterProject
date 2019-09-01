import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class DioPage extends StatelessWidget {
  const DioPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("dio网络请求")),
        body: Column(
          children: <Widget>[DioPageBody()],
        ));
  }
}

class DioPageBody extends StatelessWidget {
  const DioPageBody({Key key}) : super(key: key);

  Future<List> requestForData() async {
    try {
      Dio dio = Dio();
      Response response =
          await dio.get("https://api.apiopen.top/musicBroadcasting");
      if (response.statusCode == 200) {
        return response.data["result"][0]["channellist"];
      } else {
        throw Error();
      }
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: requestForData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text("加载中..."),
          );
        }
        return Text(snapshot.data.toString(),
            maxLines: 20, overflow: TextOverflow.ellipsis);
      },
    );
  }
}
