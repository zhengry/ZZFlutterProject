import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DrawerPage extends StatefulWidget {
  DrawerPage({Key key}) : super(key: key);

  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            
            height: ScreenUtil.getInstance().setHeight(300),
            child: UserAccountsDrawerHeader(
              accountName: Text("Baylee的小站"),
              accountEmail: Text("baylee.zry@foxmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://c-ssl.duitang.com/uploads/item/201701/04/20170104180647_GJcfB.jpeg"),
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
                image: DecorationImage(
                  image: NetworkImage("https://c-ssl.duitang.com/uploads/item/201807/24/20180724154430_5wKmm.jpeg"),
                  fit: BoxFit.fill),
      
              ),
            ),
          ),
          ListTile(
            title: Text("我的小站"),
            leading: Icon(Icons.people),
            onTap: (){
              Navigator.pop(context);//隐藏侧边栏
              Navigator.pushNamed(context, "/user");//进入userInfo页面
            },
          ),
          Divider(),
          ListTile(
            title: Text("美丽家园"),
            leading: Icon(Icons.nature)
          ),
          Divider(),
          ListTile(
            title: Text("设置"),
            leading: Icon(Icons.settings),
            onTap: (){
              Navigator.pop(context);
              Navigator.pushNamed(context, "/login");
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}