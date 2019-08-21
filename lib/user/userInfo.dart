import 'package:flutter/material.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("personal info"),
      ),
      body: ListView(
        children: <Widget>[
          Card(child: ListTile(title: Text("name"), subtitle: Text("Baylee"))),
          Card(child: ListTile(title: Text("age"), subtitle: Text("19 years old"))),
          Card(child: ListTile(title: Text("gender"), subtitle: Text("girl")))
        ],
      ),
    );
  }
}
