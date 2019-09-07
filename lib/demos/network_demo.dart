import 'package:flutter/material.dart';
import '../util/network.dart';
import '../util/urls.dart';

class NetworkRequestPage extends StatefulWidget {
  NetworkRequestPage({Key key}) : super(key: key);



  _NetworkRequestPageState createState() => _NetworkRequestPageState();
}

class _NetworkRequestPageState extends State<NetworkRequestPage> {

   String result;
  @override
  void initState() {
    loadListResult();
    super.initState();
  }

  void loadListResult() async {
   Network.getFor(URLManager.channelList).then((value){
     var data = value.toString();
     setState(() {
       result = data.toString();
     });
   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("network封装测试")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
       child: Text(result ?? "没有数据"),
    ),
    );
  }
}