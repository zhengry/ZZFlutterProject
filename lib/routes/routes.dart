import 'package:flutter/material.dart';
import 'package:my_flutter_app/demos/dio_page.dart';
import '../user/userInfo.dart';
import '../setting/setting.dart';
import '../tabs/tab.dart';
import '../login/login.dart';
import '../demos/buttons.dart';
import '../demos/dialog.dart';
import '../demos/expansionPanel.dart';
import '../demos/chip_page.dart';
import '../demos/datatable.dart';
import '../demos/step.dart';
import '../demos/add_count.dart';
import '../demos/stream_demo.dart';
import '../demos/rxdart/rxdart_page.dart';
import '../demos/http_demo.dart';

final routes = {
    "/":(context)=>Tabs(),
    "/setting":(context)=>SettingPage(),
    "/user":(context)=>UserInfoPage(),
    "/login":(context)=>LoginPage(),
    "/buttons":(context)=>ButtonView(),
    "/dialog":(context)=>DialogPage(),
    "/panel":(context)=>ExpansionPage(),
    "/chip":(context)=>ChipPage(),
    "/table":(context)=>DataTablePage(),
    "/step":(context)=>StepperPage(),
    "/add":(context)=>AddCountPage(),
    "/stream":(context)=>StreamPage(),
    "/rxdart":(context)=>RxDartPage(),
    "/http":(context)=>HttpPage(),
    "/dio":(context)=>DioPage(),
};

var onGenerateRoute = (RouteSettings settings){
    // 统一处理
      final String name = settings.name; 
      final Function pageContentBuilder = routes[name];
      if (pageContentBuilder != null) {
        if (settings.arguments != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }else{
            final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context));
            return route;
        }
      }
};