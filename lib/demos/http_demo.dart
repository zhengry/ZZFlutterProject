import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpPage extends StatelessWidget {
  const HttpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("http请求"),
      ),
      body: HttpPageBody(),
    );
  }
}

class HttpPageBody extends StatefulWidget {
  HttpPageBody({Key key}) : super(key: key);

  _HttpPageBodyState createState() => _HttpPageBodyState();
}

class _HttpPageBodyState extends State<HttpPageBody> {

   String _name = "";
   String _job = "";


  @override
  void initState() {
    super.initState();

    // jsonTest();
  }

  //map转json，json转map
  // jsonTest() {
  //   final _jsonMap = {"name": "Baylee", "job": "An iOS developer."};
  //   //map转json
  //   final json = convert.json.encode(_jsonMap);
  //   print(json);
  //   //json转map
  //   final _mapFromJson = convert.json.decode(json);
  //   print(_mapFromJson);
  // }

  // 获取小说列表
  _fetchNovelList() async {
    final response = await http.get("https://www.apiopen.top/novelApi");
    final jsonModel = convert.json.decode(response.body);
    print(response.body);
  }

  _fetchPersonInfo() {
    final _person = {"name": "Baylee", "job": "An iOS developer."};
    final _json = convert.json.encode(_person);
    final _map = convert.json.decode(_json);
    final person = PersonInfo.fromJson(_map);
    setState(() {
      _name = person.name;
      _job = person.job;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FlatButton(
          child: Text("获取小说列表"),
          onPressed: _fetchNovelList,
        ),
        FlatButton(
          child: Text("获取用户信息"),
          onPressed: _fetchPersonInfo,
        ),
        Divider(),
        ListTile(
          title: Text(_name),
          subtitle: Text(_job),
        )
      ],
    );
  }
}

class PersonInfo {
  final String name;
  final String job;

// 构造函数
  PersonInfo(this.name, this.job);

  PersonInfo.fromJson(Map json)
  : name = json["name"],
    job = json["job"];
}
