import 'package:flutter/material.dart';
import '../model/post_data.dart';

// import '../setting/setting.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("我的"),
          elevation: 0.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black54,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 1.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.search)),
              Tab(icon: Icon(Icons.folder)),
              Tab(icon: Icon(Icons.border_inner)),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            InputViewDemo(),
            SliverGridViewDemo(),
            SliverListViewDemo()
          ],
        ),
      ),
    );
  }
}

class InputViewDemo extends StatefulWidget {
  InputViewDemo({Key key}) : super(key: key);
  
  _InputViewDemoState createState() => _InputViewDemoState();
}

class _InputViewDemoState extends State<InputViewDemo> {
  final inputController = TextEditingController();

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }


  @override
  void initState() {
    inputController.text = "userName";//设置初始值
    // addListener的参数是个回调函数
    inputController.addListener((){
      debugPrint("input = ${inputController.text}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        child: TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.supervised_user_circle),//设置左边icon
            labelText: "姓名",
            // border:InputBorder.none,//无边框
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
              ),//设置边框
            hintText: "请输入您的姓名",//placeholder
            filled: true,//是否填充背景色,默认灰色背景
            fillColor: Colors.white60//背景色的填充颜色
          ),
          // onChanged: (text){
          //   debugPrint("输入的内容是$text");
          // },
          controller: inputController,
          onSubmitted: (text){
            debugPrint("提交了");
          },
        ),
      );
  }
}

class SliverGridViewDemo extends StatelessWidget {
  const SliverGridViewDemo({Key key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(//给SliverGrid添加内边距
          padding: EdgeInsets.all(4),
          sliver: SliverGridDemo(),
        ),
      ],
    );
  }
}

class SliverListViewDemo extends StatelessWidget {
  const SliverListViewDemo({Key key}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPadding(//给SliverGrid添加内边距
          padding: EdgeInsets.all(4),
          sliver: SliverListDemo(),
        ),
      ],
    );
  }
}



// SliverGrid 网格视图
class SliverGridDemo extends StatelessWidget {
  const SliverGridDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8.0,
            childAspectRatio: 0.7
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                  child: Image.network(posts[index]["imageUrl"],
                      fit: BoxFit.fill));
            },
            childCount: posts.length
          ),
        );
  }
}

//SliverList 列表视图
class SliverListDemo extends StatelessWidget {
  const SliverListDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(

          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                  child: Image.network(posts[index]["imageUrl"],
                      fit: BoxFit.fill));
            },
            childCount: posts.length
          ),
        );
  }
}

