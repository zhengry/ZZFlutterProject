import 'dart:convert' as convert;
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

  @override
  void initState() {
    super.initState();
    _fetchList();

  }

  // 获取列表数据
  Future <List<Result>> _fetchList() async {
    final response = await http.get("https://api.apiopen.top/musicBroadcasting");
    final json = convert.json.decode(response.body);
    final pictures = MusicInfo.fromJson(json);
    return pictures.result;
  }

  Widget _channelView(Channellist channel){
    return Container(
      padding: EdgeInsets.only(top: 5),
      child: ListTile(
        leading: Image.network(((channel.thumb != null ) ? channel.thumb : channel.avatar)?? "https://c-ssl.duitang.com/uploads/item/201606/20/20160620104244_vZEnj.jpeg"),
        title: Text(channel.name),
      ),
    );
  }

  Widget _item(String title,List<Channellist> datas,bool isExpansion){
    return ExpansionTile(
      title: Text(title,
        style:TextStyle(
          fontSize:18
        )
      ),
      children: datas.map((channel)=>_channelView(channel)).toList(),
      initiallyExpanded: isExpansion,
      onExpansionChanged: (bool isExpansion){
  
      },
    );

  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _fetchList(),
      builder: (context, snapshot){
        final list = snapshot.data as List<Result>;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text("loading"),
          );
        }

        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext context,int index){
            final model = list[index];
            return _item(model.title, model.channellist,false);
          },
        );
      },
    );
    
  }
}



class MusicInfo {
  int code;
  String message;
  List<Result> result;

  MusicInfo({this.code, this.message, this.result});

  MusicInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  List<Channellist> channellist;
  String title;
  int cid;

  Result({this.channellist, this.title, this.cid});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['channellist'] != null) {
      channellist = new List<Channellist>();
      json['channellist'].forEach((v) {
        channellist.add(new Channellist.fromJson(v));
      });
    }
    title = json['title'];
    cid = json['cid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.channellist != null) {
      data['channellist'] = this.channellist.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    data['cid'] = this.cid;
    return data;
  }
}

class Channellist {
  String thumb;
  String name;
  String cateName;
  String cateSname;
  String chName;
  int value;
  String channelid;
  String artistid;
  String avatar;

  Channellist(
      {this.thumb,
      this.name,
      this.cateName,
      this.cateSname,
      this.chName,
      this.value,
      this.channelid,
      this.artistid,
      this.avatar});

  Channellist.fromJson(Map<String, dynamic> json) {
    thumb = json['thumb'];
    name = json['name'];
    cateName = json['cate_name'];
    cateSname = json['cate_sname'];
    chName = json['ch_name'];
    value = json['value'];
    channelid = json['channelid'];
    artistid = json['artistid'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumb'] = this.thumb;
    data['name'] = this.name;
    data['cate_name'] = this.cateName;
    data['cate_sname'] = this.cateSname;
    data['ch_name'] = this.chName;
    data['value'] = this.value;
    data['channelid'] = this.channelid;
    data['artistid'] = this.artistid;
    data['avatar'] = this.avatar;
    return data;
  }
}
