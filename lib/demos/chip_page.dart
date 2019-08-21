import 'package:flutter/material.dart';

class ChipPage extends StatelessWidget {
  const ChipPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("chip碎片"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Wrap(
          spacing: 10.0,
          runSpacing: 15.0,
          runAlignment: WrapAlignment.center,
          children: <Widget>[
            Chip(
              label: Text("a new chip"),
            ),
            Chip(
              label: Text("我是一只小小小小鸟，怎么飞也飞不高"),
              backgroundColor: Colors.red,
            ),
            Chip(
              label: Text("瓜子"),
              avatar: CircleAvatar(
                backgroundColor: Colors.blue,
                child: Text("小"),
              ),
            ),
            Chip(
              label: Text("这是什么"),
              avatar: CircleAvatar(
                child: Image.network(
                    "https://c-ssl.duitang.com/uploads/item/201708/19/20170819224619_2xTKe.jpeg"),
              ),
            ),
            Chip(
              label: Text("热门"),
              onDeleted: (){
                
              },
              deleteIcon:Icon(Icons.delete),//自定义删除图标，默认是个close
              deleteIconColor: Colors.blue,//设置删除图标的颜色
              // deleteButtonTooltipMessage: "确定要删除我吗？",//长按删除按钮的提示
            ),
            Divider(
              color: Colors.red,
              height: 0, //可以看做是距离上面组件的距离
            )
          ],
        ),
      ),
    );
  }
}
