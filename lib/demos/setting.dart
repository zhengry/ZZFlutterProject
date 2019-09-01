import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {

  // final arguments;
  // SettingPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我是设置啊"),
      ),
      body: Container(
          child: Image.network(
              "https://a-ssl.duitang.com/uploads/item/201903/14/20190314225002_gqrcm.jpg"),
          alignment: Alignment.center),
    );
  }
}

