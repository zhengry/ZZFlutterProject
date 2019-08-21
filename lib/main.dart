import 'package:flutter/material.dart';
import 'routes/routes.dart';
// import 'tabs/tab.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: Tabs(),
      initialRoute:"/",
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,//是否显示debug条幅
      theme: ThemeData(
        primaryColor: Colors.green[300],
        buttonColor: Colors.orange[300],
        // buttonTheme: ButtonThemeData(
        //   buttonColor: Colors.green[300],
        //   textTheme: ButtonTextTheme.normal,
        //   minWidth: 40,
        //   height: 43,
        //   shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(8)
        //   ),
        // ),
        appBarTheme: AppBarTheme(
          color: Colors.green[200],
          elevation: 0.0,
          textTheme: TextTheme(
            title: TextStyle(fontSize: 18.0,color: Colors.white),
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          )
        )
      ),
    );
  }
}
