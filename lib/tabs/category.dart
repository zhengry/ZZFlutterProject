import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("功能列表"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("按钮列表演示"),
              onTap: (){
                Navigator.of(context).pushNamed("/buttons");
              },
            ),
            ListTile(
              title: Text("对话框（alert）"),
              onTap: (){
                Navigator.of(context).pushNamed("/dialog");
              },
            ),
            ListTile(
              title: Text("伸缩面板"),
              onTap: (){
                Navigator.of(context).pushNamed("/panel");
              },
            ),
            
            ListTile(
              title: Text("chip"),
              onTap: (){
                Navigator.of(context).pushNamed("/chip");
              },
            ),
            ListTile(
              title: Text("dataTable"),
              onTap: (){
                Navigator.of(context).pushNamed("/table");
              },
            ),
            ListTile(
              title: Text("stepper"),
              onTap: (){
                Navigator.of(context).pushNamed("/step");
              },
            ),
            ListTile(
              title: Text("stream"),
              onTap: (){
                Navigator.of(context).pushNamed("/stream");
              },
            ),
            ListTile(
              title: Text("rxdart"),
              onTap: (){
                Navigator.of(context).pushNamed("/rxdart");
              },
            ),
            ListTile(
              title: Text("http请求"),
              onTap: (){
                Navigator.of(context).pushNamed("/http");
              },
            ),
            ListTile(
              title: Text("dio请求"),
              onTap: (){
                Navigator.of(context).pushNamed("/dio");
              },
            ),
          ],
        ),
      ),
    );
  }
}
