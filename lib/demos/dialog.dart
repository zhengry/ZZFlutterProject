import 'package:flutter/material.dart';

enum DialogOption { nameA, nameB }

class DialogPage extends StatefulWidget {
  DialogPage({Key key}) : super(key: key);

  _DialogPageState createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  final bottomSheetKey = GlobalKey<ScaffoldState>();
  String choice = "还没选呢";

  // 弹出一个simpleDialog,需要传值的时候 方法名后面加上async异步标记，里面的showDialog加上await
  void showMySimpleDialog() async {
    final option = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text("I am a simple dialog"),
            children: <Widget>[
              SimpleDialogOption(
                child: Text("are you ok"),
                onPressed: () {
                  debugPrint("你看了我,就要对我负责");
                  // 传值
                  Navigator.pop(context, DialogOption.nameA); //隐藏对话框
                },
              ),
              SimpleDialogOption(
                child: Text("make a friend"),
                onPressed: () {
                  debugPrint("选择了我,就要对我负责");
                  Navigator.pop(context, DialogOption.nameB); //隐藏对话框
                },
              )
            ],
          );
        });

    switch (option) {
      case DialogOption.nameA:
        setState(() {
          choice = "A";
        });
        break;
      case DialogOption.nameB:
        setState(() {
          choice = "B";
        });
        break;
      default:
    }
  }

  // 弹出一个alertDialog
  void showMyAlertDialog() {
    showDialog(
        context: context,
        barrierDismissible: false, //点击周围是否会dismiss alert
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("this is an alertDialog title"),
            content: Text("this is the alert content"),
            actions: <Widget>[
              FlatButton(
                child: Text("cancel"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              FlatButton(
                child: Text("OK"),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  // 弹出一个BottomSheet
  void showMyBottomSheet() {

    bottomSheetKey
      .currentState
      .showBottomSheet((BuildContext context) {
        return BottomAppBar(
          child: Container(
            color: Colors.orange,
            height: 200.0,
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.calendar_today),
                  title: Text("日历"),
                )
              ],
            ),
          ),
        );
      });
  }

  void showMyModalBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context){
        return Container(
            height: 300,
            // width: double.infinity,
            color: Colors.white10,
            child: Column(
              children: <Widget>[
                // Text("data"),
                // Text("data"),
                // Text("data"),
                ListTile(
                  title: Text("选项A"),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("选项B"),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text("选项C"),
                  onTap: (){
                    Navigator.pop(context);
                  },
                )
              ],
            ),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: bottomSheetKey,
      appBar: AppBar(title: Text("对话框")),
      body: Container(
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Text("你选择的结果是$choice"),
              SizedBox(width: 20),
              RaisedButton.icon(
                icon: Icon(Icons.add_alert),
                label: Text("show a simpleDialog"),
                onPressed: showMySimpleDialog,
              )
            ]),
            Row(
              children: <Widget>[
                Text("alertDialog选择结果："),
                SizedBox(
                  width: 20,
                ),
                RaisedButton(
                  child: Text("show a alertDialog"),
                  color: Colors.blue,
                  onPressed: showMyAlertDialog,
                )
              ],
            ),
            Row(
              children: <Widget>[
                Text("BottomSheet"),
                RaisedButton(
                  child: Text("show a bottomsheet"),
                  color: Colors.redAccent,
                  onPressed: showMyModalBottomSheet,//showMyBottomSheet,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
