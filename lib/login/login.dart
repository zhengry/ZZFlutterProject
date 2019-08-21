import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("登录"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: FormView(),
      )
      
    );
  }
}

class FormView extends StatefulWidget {
  FormView({Key key}) : super(key: key);

  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
// 通过key来标识表单
 final loginFormKey = GlobalKey<FormState>();
  String name,password;
  bool _autoValidate = true;
  // loginBtnClick
  void submitLoginForm() {
    // 调用表单的save方法
    loginFormKey.currentState.save();
    // 获取验证结果
    bool result = loginFormKey.currentState.validate();
    if (!result) {
      return;
    }
    debugPrint("登录成功");
    Navigator.pop(context);
  }

  String validateUserName(String text) {
    if (text.isEmpty) {
      return "name is required";
    }
    return null;
  }

  String validatePassword(String pass) {
    if (pass.isEmpty) {
      return "password is required";
    }
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration:InputDecoration(labelText: "name", helperText: ""),
              onSaved: (value){
                name = value;
              },
              validator: validateUserName,
              autovalidate: _autoValidate,
            ),
            
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "password",
                helperText: "",
              ),
              onSaved: (value) {
                password = value;
              },
              validator: validatePassword,
              autovalidate: _autoValidate,
            ),
            SizedBox(height: 40),
            Container(
              width: 260,
              height: 43,
              color: Colors.blueGrey,
              child: FlatButton(
                child: Text("Login",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                color: Colors.blueAccent,
                onPressed: submitLoginForm,
              ),
            )
          ],
        ),
      );
  }
}
