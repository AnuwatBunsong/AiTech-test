import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cremation/presenter/login_presenter.dart';
import 'package:cremation/model/user_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginContract {
  BuildContext _ctx;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _username, _password;
  bool _isLoading = false;
  LoginPresenter _presenter;

  _LoginPageState() {
    _presenter = new LoginPresenter(this);
  }

  void _submit() {
    final form = formKey.currentState;
    if (form.validate()) {
      setState(() => _isLoading = true);
      form.save();
      _presenter.doLogin(_username, _password);
    }
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(text)));
  }

  @override
  Widget build(BuildContext context) {
    _ctx = context;
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/splash_screen.jpg"),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter)),
            child: ListView(children: [
              ConstrainedBox(
                  constraints: new BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height - 40),
                  child: Align(
                      child: Column(children: <Widget>[
                    Container(
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Column(children: [
                                Image.asset('assets/images/logo_120x120.png'),
                              ])),
                          Text('สำนักงานการณาปนกิจสงเคราะห์',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SukhumvitText',
                                fontSize: 24,
                              )),
                          Text('กระทรวงสาธารณสุข',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'SukhumvitText',
                                fontSize: 24,
                              ))
                        ],
                      ),
                    ),
                    Container(
                        width: (MediaQuery.of(context).size.width - 20),
                        padding: const EdgeInsets.only(
                            top: 30.0, bottom: 30.0, left: 15.0, right: 15.0),
                        margin: const EdgeInsets.only(top: 30.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                        ),
                        alignment: Alignment.topLeft,
                        child: Form(
                            key: formKey,
                            child: Column(children: <Widget>[
                              Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(
                                      left: 15.0, bottom: 10.0),
                                  child: Text('เข้าสู่ระบบด้วยเลขสมาชิก',
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'SukhumvitText',
                                        fontSize: 15,
                                      ))),
                              Container(
                                  width: (MediaQuery.of(context).size.width),
                                  height: (45.0),
                                  margin: const EdgeInsets.only(bottom: 15.0),
                                  child: new TextFormField(
                                      onSaved: (val) => _username = val,
                                      validator: (val) {
                                        return val.length < 3
                                            ? "Username must have atleast 3 chars"
                                            : null;
                                      },
                                      decoration: new InputDecoration(
                                        prefixIcon: new Image.asset(
                                            'assets/icons/user.png'),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(30.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Color(0xFF1EFA746),
                                              width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(30.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Color(0xFF1EFA746),
                                              width: 1.0),
                                        ),
                                      ),
                                      enabled: true,
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          height: 0.8,
                                          color: Color(0xFF000000)))),
                              Container(
                                  alignment: Alignment.topLeft,
                                  margin: const EdgeInsets.only(
                                      left: 15.0, bottom: 10.0),
                                  child: Text('รหัสผ่าน',
                                      style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontFamily: 'SukhumvitText',
                                        fontSize: 15,
                                      ))),
                              Container(
                                  width: (MediaQuery.of(context).size.width),
                                  height: (45.0),
                                  margin: const EdgeInsets.only(bottom: 15.0),
                                  alignment: Alignment.centerLeft,
                                  child: new TextFormField(
                                      onSaved: (val) => _password = val,
                                      decoration: new InputDecoration(
                                        prefixIcon: new Image.asset(
                                            'assets/icons/key.png'),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(30.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Color(0xFF1EFA746),
                                              width: 1.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: const BorderRadius.all(
                                            const Radius.circular(30.0),
                                          ),
                                          borderSide: BorderSide(
                                              color: Color(0xFF1EFA746),
                                              width: 1.0),
                                        ),
                                      ),
                                      obscureText: true,
                                      obscuringCharacter: "*",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          height: 0.8,
                                          color: Color(0xFF000000)))),
                              Container(
                                  alignment: Alignment.topRight,
                                  margin: const EdgeInsets.only(bottom: 20.0),
                                  child: Text('ลืมรหัสผ่าน?',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xFF000000),
                                        fontFamily: 'SukhumvitText',
                                        fontSize: 15,
                                      ))),
                              Container(
                                  height: 50.0,
                                  margin: const EdgeInsets.only(bottom: 15.0),
                                  child: /*_isLoading ? new CircularProgressIndicator() :*/ RaisedButton(
                                      onPressed: _submit,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      padding: EdgeInsets.all(0.0),
                                      child: Ink(
                                          decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFFEFA746),
                                                  Color(0xFFF0C984)
                                                ],
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30.0)),
                                          child: Container(
                                              constraints: BoxConstraints(
                                                  minHeight: 50.0),
                                              alignment: Alignment.center,
                                              child: Text("เข้าสู่ระบบ",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFFFFFFFF),
                                                    fontFamily: 'SukhumvitText',
                                                    fontSize: 20,
                                                  )))))),
                              Container(
                                  alignment: Alignment.center,
                                  child: Text('ติดต่อผู้ดูแลระบบผ่าน Line',
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Color(0xFF626262),
                                        fontFamily: 'SukhumvitText',
                                        fontSize: 14,
                                      ))),
                            ]))),
                    Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 30.0),
                        child: Text('เข้าสู่ระบบสมาชิกใหม่',
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontFamily: 'SukhumvitText',
                              fontSize: 20,
                            ))),
                  ])))
            ])));
  }

  @override
  void onLoginError(String errorTxt) {
    //_showSnackBar(errorTxt);
    setState(() => _isLoading = false);
    Alert(
      context: context,
      type: AlertType.error,
      title: "username หรือ password ไม่ถูกต้อง",
      style: AlertStyle(
          titleStyle: TextStyle(
              color: Colors.red, fontSize: 20, fontFamily: 'SukhumvitText')),
      buttons: [
        DialogButton(
          child: Text(
            "ตกลง",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'SukhumvitText'),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
  }

  @override
  void onLoginSuccess(User user) async {
    //_showSnackBar(user.toString());
    setState(() => _isLoading = false);
    //var authStateProvider = new AuthStateProvider();
    //authStateProvider.notify(AuthState.LOGGED_IN);
    Navigator.pushNamed(context, '/main_page');
  }
}
