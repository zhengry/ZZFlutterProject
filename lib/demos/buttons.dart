
import 'package:flutter/material.dart';


class ButtonView extends StatelessWidget {
  const ButtonView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("按钮测试",)
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text("按钮1"),
                  splashColor: Colors.grey,//渐没效果
                  shape: StadiumBorder(),//圆角按钮
                  onPressed: (){
                    debugPrint("点击了按钮1");
                  },
                ),
                SizedBox(width: 20),
                FlatButton.icon(
                  textColor: Colors.white,
                  color: Colors.blue,
                  icon: Icon(Icons.add_alert),
                  label: Text("按钮2啊"),
                  splashColor: Colors.grey,//渐没效果
                  onPressed: (){
                    debugPrint("点击了按钮2啊");
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  elevation: 10.0,
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text("按钮1"),
                  splashColor: Colors.grey,//渐没效果
                  onPressed: (){
                    debugPrint("点击了按钮1");
                  },
                ),
                SizedBox(width: 20),
                RaisedButton.icon(
                  elevation: 0.0,
                  textColor: Colors.white,
                  color: Colors.blue,
                  icon: Icon(Icons.add_alert),
                  label: Text("按钮2啊"),
                  splashColor: Colors.grey,//渐没效果
                  onPressed: (){
                    debugPrint("点击了按钮2啊");
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlineButton(//描边按钮，默认有个边框
                  textColor: Colors.orange,
                  // color: Colors.orange,//设置背景色无效
                  child: Text("按钮1"),
                  splashColor: Colors.grey,//渐没效果
                  borderSide: BorderSide(color: Colors.orange,width: 3),
                  onPressed: (){
                    debugPrint("点击了按钮1");
                  },
                ),
                SizedBox(width: 20),
                OutlineButton.icon(
                  textColor: Colors.grey,
                  icon: Icon(Icons.add_alert),
                  label: Text("按钮2啊"),
                  splashColor: Colors.grey,//渐没效果
                  highlightedBorderColor: Colors.orange,
                  onPressed: (){
                    debugPrint("点击了按钮2啊");
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(//会占满可用空间（宽或者高）
                  child:OutlineButton(//描边按钮，默认有个边框
                  textColor: Colors.orange,
                  // color: Colors.orange,//设置背景色无效
                  child: Text("按钮1"),
                  splashColor: Colors.grey,//渐没效果
                  borderSide: BorderSide(color: Colors.orange,width: 3),
                  onPressed: (){
                    debugPrint("点击了按钮1");
                  },
                ))
                ,
                SizedBox(width: 20),
                Expanded(
                  flex: 3,
                  child: OutlineButton.icon(
                    textColor: Colors.grey,
                    icon: Icon(Icons.add_alert),
                    label: Text("按钮2啊"),
                    splashColor: Colors.grey,//渐没效果
                    highlightedBorderColor: Colors.orange,
                    onPressed: (){
                      debugPrint("点击了按钮2啊");
                    },
                  ),)
              ],
            ),
            Row(
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                    buttonTheme: ButtonThemeData(padding: EdgeInsets.symmetric(horizontal: 50.0)),
                  ),
                  child: ButtonBar(
                  children: <Widget>[
                    OutlineButton(//描边按钮，默认有个边框
                      textColor: Colors.orange,
                      // color: Colors.orange,//设置背景色无效
                      child: Text("按钮1"),
                      splashColor: Colors.grey,//渐没效果
                      borderSide: BorderSide(color: Colors.orange,width: 3),
                      onPressed: (){
                        debugPrint("点击了按钮1");
                      },
                    ),
                    OutlineButton.icon(
                      textColor: Colors.grey,
                      icon: Icon(Icons.add_alert),
                      label: Text("按钮2啊"),
                      splashColor: Colors.grey,//渐没效果
                      highlightedBorderColor: Colors.orange,
                      onPressed: (){
                        debugPrint("点击了按钮2啊");
                      },
                    )
                  ],
                ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                PopupMenuButton(
                  icon: Icon(Icons.spellcheck),
                  onSelected: (value){
                    debugPrint(value);
                  },
                  itemBuilder: (BuildContext context)=>[
                    PopupMenuItem(
                      value: "选项1",
                      child: Text("选项1"),
                    ),
                    PopupMenuItem(
                      value: "选项2",
                      child: Text("选项2"),
                    ),
                    PopupMenuItem(
                      value: "选项3",
                      child: Text("选项3"),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}