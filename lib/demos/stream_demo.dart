import 'package:flutter/material.dart';
import 'dart:async';

class StreamPage extends StatelessWidget {
  const StreamPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("stream 流"),
      ),
      body: StreamBody(),
    );
  }
}

class StreamBody extends StatefulWidget {
  StreamBody({Key key}) : super(key: key);

  _StreamBodyState createState() => _StreamBodyState();
}

class _StreamBodyState extends State<StreamBody> {
  String _dataValue;
  int _currentStreamCount = 0;
  StreamController<String> _streamController; //流控制器
  StreamSubscription _subscription; //订阅者
  StreamSubscription _subscription2;
  StreamSink _dataSink;
  @override
  void initState() {
    super.initState();
    _streamController = StreamController<String>.broadcast();
    _dataSink = _streamController.sink;
    _subscription = _streamController.stream.listen(onData, onDone: onDone);
    _subscription2 = _streamController.stream.listen(onData2); //多个订阅
  }

  //获取到数据后调用
  void onData(String data) {
    setState(() {
      _dataValue = data;
    });
    print("_subscription = $_subscription");
  }

  void onData2(String data) {
    print("获取到的订阅数据是:$data");
    print("_subscription2 = $_subscription2");
  }

  void onError(Error error) {
    print(error);
  }

  void onDone() {
    print("done!");
  }

// 添加数据
  void _addData() async {
    String data = await fetchData();
    // _streamController.add(data);//使用流控制器添加数据
    _dataSink.add(data); //使用StreamSink添加数据
  }

// 恢复订阅
  void _resumeSubcription() {
    _subscription.resume();
  }

// 暂停订阅
  void _pauseSubscription() {
    _subscription.pause();
  }

// 取消订阅
  void _cancelSubscription() {
    _subscription.cancel();
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 1));
    _currentStreamCount++;
    return "$_currentStreamCount";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text("$_dataValue", style: TextStyle(fontSize: 40, color: Colors.red)),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text("addData"),
              onPressed: _addData,
            ),
            FlatButton(
              child: Text("resume"),
              onPressed: _resumeSubcription,
            ),
            FlatButton(
              child: Text("pause"),
              onPressed: _pauseSubscription,
            ),
            FlatButton(
              child: Text("cancel"),
              onPressed: _cancelSubscription,
            ),
          ],
        ),
        SizedBox(height: 30),
        StreamBuilder(
          stream: _streamController.stream, //要使用的stream
          initialData: "no data", //添加初始化数据
          builder: (context, snapshot) {
            return Text("根据Stream数据构建的小部件：${snapshot.data}",
                style: TextStyle(fontSize: 18, color: Colors.blue));
          },
        )
      ],
    );
  }
}
