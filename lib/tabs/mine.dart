

import 'package:flutter/material.dart';

// import '../setting/setting.dart';

class MinePage extends StatelessWidget {
  const MinePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("我的")),
      body: Column(
        children: <Widget>[
          _userInfoWidget(),
          _userOptionsWidget()
        ],
      ),
    );
  }

  Widget _userInfoWidget() {
    return Container(
          padding: EdgeInsets.all(20),
          
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 10,color: Colors.black12)),
            // color: Colors.red
          ),
          child: Row(
            
            children: <Widget>[
              ClipOval(
                child: Image.network("https://c-ssl.duitang.com/uploads/item/201701/04/20170104180647_GJcfB.jpeg",width: 100,height: 100),
                
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  Text("Baylee",style: TextStyle(fontSize: 28),),
                  SizedBox(height: 12),
                  Text("baylee.zry@foxmail.com")
                ],
              )
            ],
          ),
        );
  }
  Widget _userOptionsWidget() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("设置"),
          trailing: Icon(Icons.arrow_right),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text("消息"),
          trailing: Icon(Icons.arrow_right),
        )
      ],
    );
  }
}

