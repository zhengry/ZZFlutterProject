import 'package:flutter/material.dart';

class ExpansionPage extends StatefulWidget {
  ExpansionPage({Key key}) : super(key: key);

  _ExpansionPageState createState() => _ExpansionPageState();
}

class _ExpansionPageState extends State<ExpansionPage> {
  bool isPanelExpaned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ExpansionPanel"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int index,bool isExpaned){
                setState(() {
                  
                  isPanelExpaned = !isExpaned;
                });
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context,bool isExpaned){
                    return Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerLeft,
                      child: Text("李冲冲"),
                    );
                  },
                  body: Container(
                    height: 100,
                    alignment: Alignment.center,
                    child: Text("你就是个充数贼",style: TextStyle(fontSize: 30)),
                  ),
                  isExpanded: isPanelExpaned,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
