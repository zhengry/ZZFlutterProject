import 'package:flutter/material.dart';
import '../model/post_data.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("我的计划"),),
      body: GridViewBuilderDemo(),
    );
  }
}

//GirdView.count使用
class GridViewCountDemo extends StatelessWidget {
  const GridViewCountDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,//交叉轴方向Item个数
      crossAxisSpacing: 10,
      mainAxisSpacing: 12,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Container(
            color: Colors.greenAccent,
            alignment: Alignment.center,
            child: Text("我是一个Item"),
          ),
          Container(
            color: Colors.greenAccent,
            alignment: Alignment.center,
            child: Text("我是一个Item"),
          ),
          Container(
            color: Colors.greenAccent,
            alignment: Alignment.center,
            child: Text("我是一个Item"),
          ),
          Container(
            color: Colors.greenAccent,
            alignment: Alignment.center,
            child: Text("我是一个Item"),
          ),
          Container(
            color: Colors.greenAccent,
            alignment: Alignment.center,
            child: Text("我是一个Item"),
          ),
          Container(
            color: Colors.greenAccent,
            alignment: Alignment.center,
            child: Text("我是一个Item"),
          ),
 
      ],
    );
  }
}

// GridView.extend使用
class GridViewExtendDemo extends StatelessWidget {
  const GridViewExtendDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.extent(
        maxCrossAxisExtent: 150,//交叉轴方向上每个Item的尺寸
        crossAxisSpacing: 10,//交叉轴方向Item间隙
        mainAxisSpacing: 10,//主轴item间隙
        scrollDirection: Axis.vertical,//滚动方向
        children: <Widget>[
          
          Container(
            color: Colors.blueAccent,
            alignment: Alignment.center,
            child: Text("我是一个Item"),
          ),
          Container(
            color: Colors.blueAccent,
            alignment: Alignment.center,
            child: Text("我是一个Item"),
          ),
          Container(
            color: Colors.blueAccent,
            alignment: Alignment.center,
            child: Text("我是一个Item"),
          ),
          Container(
            color: Colors.blueAccent,
            alignment: Alignment.center,
            child: Text("我是一个Item"),
          ),
          Container(
            color: Colors.blueAccent,
            alignment: Alignment.center,
            child: Text("我是一个Item"),
          ),
          Container(
            color: Colors.blueAccent,
            alignment: Alignment.center,
            child: Text("我是一个Item"),
          ),
          Container(
            color: Colors.blueAccent,
            alignment: Alignment.center,
            child: Text("我是一个Item"),
          ),
        ],
      ),
    );
  }
}



class GridViewBuilderDemo extends StatelessWidget {
  const GridViewBuilderDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: posts.length,
      itemBuilder: _gridItemBuider,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(  
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }

  Widget _gridItemBuider(BuildContext context,int index){
    return Image.network(posts[index]["imageUrl"],
      fit:BoxFit.cover);
  }
}

