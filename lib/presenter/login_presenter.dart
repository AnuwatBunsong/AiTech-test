import 'package:cremation/model/user.dart';

abstract class LoginPresenter {
  void onLoginSuccess(User user);
  void onLoginError(String errorTxt);
}

class _LoginPresenter {
  LoginPresenter _view;
  //RestDatasource api = new RestDatasource();
  _LoginPresenter(this._view);

  doLogin(String username, String password) {
    /*api.login(username, password).then((User user) {
      _view.onLoginSuccess(user);
    }).catchError((Exception error) => _view.onLoginError(error.toString()));*/
  }
}
