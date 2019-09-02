import 'package:flutter/material.dart';
import '../tabs/home.dart';
import '../tabs/mine.dart';
import '../tabs/category.dart';
import '../tabs/list_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);

  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  var _currentIndex = 0;
  var pages = [HomePage(),
              HistoryPage(),
              ListViewPage(),
              MinePage()];


  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Scaffold(

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("首页"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("功能列表"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            title: Text("添加"),
          ),  
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            title: Text("Grid视图")
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("我的"),
          )
        ],
        currentIndex: this._currentIndex,
        fixedColor: Theme.of(context).primaryColor,
        onTap: (index){
          setState(() {
            if (index != 2) {
              this._currentIndex = index;
            }else {
              Navigator.pushNamed(context, "/add");
            }
            
          });
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.add,color: Colors.white,size: 30,),
        onPressed: (){
          Navigator.pushNamed(context, "/add");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: this.pages[this._currentIndex < 2 ? this._currentIndex : this._currentIndex - 1],
    );
  }
}

