import 'package:flutter/material.dart';
// import '../setting/setting.dart';
import 'drawer.dart';
import '../model/post_data.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      drawer: DrawerPage(),
      body: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Colors.blue
          ),
          child: _ViewDemo()
        ),
    );
  }
}

class _ViewDemo extends StatefulWidget {
  @override
  __ViewDemoState createState() => __ViewDemoState();
}

class __ViewDemoState extends State<_ViewDemo> {
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(posts[index]["imageUrl"], fit: BoxFit.cover),
        ),
        Positioned(
          top: 10.0,
          left: 10.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(posts[index]["name"],
                  style: TextStyle(fontSize: 30, color: Colors.white)),
              Text(posts[index]["date"],
                  style: TextStyle(fontSize: 15, color: Colors.white))
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}

class _HomePageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      pageSnapping: true, //滑动是否分页，默认为true
      onPageChanged: (pageIndex) => debugPrint("page == $pageIndex"),
      controller: PageController(
          initialPage: 1, //默认为0，表示加载的第几个页面
          keepPage: false, //是否记录用户滚动到哪个页面
          viewportFraction: 1.0 //页面视图占比滚动方向屏幕宽度的百分比
          ),
      scrollDirection: Axis.horizontal,

      children: <Widget>[
        Container(
          alignment: Alignment.center,
          color: Colors.red,
          child: Text("first",
              style: TextStyle(fontSize: 40, color: Colors.white)),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.blue,
          child: Text("second",
              style: TextStyle(fontSize: 40, color: Colors.white)),
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.green,
          child: Text("third",
              style: TextStyle(fontSize: 40, color: Colors.white)),
        )
      ],
    );
  }
}
