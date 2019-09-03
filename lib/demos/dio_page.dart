import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:async';

class DioPage extends StatelessWidget {
  const DioPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("dio网络请求")), 
        body: DioPageBody());
  }
}

class DioPageBody extends StatelessWidget {
  const DioPageBody({Key key}) : super(key: key);

  Future<List<Map>> requestForData() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get(
          "https://api.apiopen.top/musicRankingsDetails",
          queryParameters: {"type": 1});
      if (response.statusCode == 200) {
        return (response.data["result"] as List).cast();
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
        return ItemListView(snapshot.data);
      },
    );
  }
}

class ItemListView extends StatelessWidget {
  final List<Map> _itemList;
  ItemListView(this._itemList);

  Widget _gridItemBuider(BuildContext context, int index) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: <Widget>[
          Image.network(_itemList[index]["pic_radio"]),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            width: double.infinity,
            color: Color.fromARGB(50, 1, 1, 1),
              child: Text(_itemList[index]["title"],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: _itemList.length,
      itemBuilder: _gridItemBuider,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
