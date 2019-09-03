import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ChannelDetailPage extends StatefulWidget {
  ChannelDetailPage({Key key}) : super(key: key);

  _ChannelDetailPageState createState() => _ChannelDetailPageState();
}

class _ChannelDetailPageState extends State<ChannelDetailPage> {
  String title = "漫步春天";
  String channelId = "public_tuijian_spring";

  @override
  void initState() {
    _fetchListDetail();
    super.initState();
  }

  // 获取列表数据
  Future<List<Map>> _fetchListDetail() async {
    String url = "https://api.apiopen.top/musicBroadcastingDetails";
    Dio dio = Dio();
    Response response =
        await dio.get(url, queryParameters: {"channelname": channelId});
    if (response.statusCode == 200) {
      return (response.data["result"]["songlist"] as List).cast();
    } else {
      throw "请求失败，请重试";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder(
        future: _fetchListDetail(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            List<Map> data = (snapshot.data as List).cast();
            return ChannelDetail(itemList: data);
          }
          return Container(
            alignment: Alignment.center,
            child: Text("loading...", style: TextStyle(fontSize: 30)),
          );
        },
      ),
    );
  }
}

class ChannelDetail extends StatelessWidget {
  final List<Map> itemList;
  const ChannelDetail({Key key, this.itemList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemList.length,
      itemBuilder: _detailItem,
    );
  }

  Widget _detailItem(BuildContext context, int index) {
    var item = itemList[index];
    if (item["artist"] == null) {
      return null;
    } 
    return ListTile(
        contentPadding: EdgeInsets.only(top: 5),
        leading: Image.network(itemList[index]["thumb"]),
        title: Text(itemList[index]["title"]),
      );
  }
}
