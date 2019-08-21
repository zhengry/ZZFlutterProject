import 'package:flutter/material.dart';


class StepperPage extends StatefulWidget {
  StepperPage({Key key}) : super(key: key);

  _StepperPageState createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {


  int _currentStep = 0;

  List _stepInfo = [
    {"title":"登录","subtitle":"密码登录"},
    {"title":"认证","subtitle":"提交身份证信息"},
    {"title":"参与活动","subtitle":"有机会赢取大奖"},
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stepper"),
      ),
      body:  Stepper(
        type:StepperType.horizontal,
        currentStep: _currentStep,
        onStepContinue: (){
          setState(() {
            _currentStep = _currentStep < _stepInfo.length - 1 ? _currentStep + 1 : 0;
          });
        },
        onStepCancel: (){
          
        },
        onStepTapped: (int index){
          setState(() {
            _currentStep = index;
          });
        },
        steps: _stepInfo.map((info){
          return Step(
            title: Text(info["title"]),
            subtitle: Text(info["subtitle"]),
            content: Container(),
            isActive: _currentStep == _stepInfo.indexOf(info),
            
          );
        }).toList(),
      ),
    );
  }
}


class CountProvider extends InheritedWidget {
  CountProvider({this.count,this.increaseCount, this.child}) : super(child: child);

  final Widget child;
  final int count;
  final VoidCallback increaseCount;
  
  static CountProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CountProvider)as CountProvider);
  }

  @override
  bool updateShouldNotify( CountProvider oldWidget) {
    return true;
  }
}