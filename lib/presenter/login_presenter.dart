import 'package:cremation/data/user_data.dart';
import 'package:cremation/model/user_model.dart';

abstract class LoginContract {
  void onLoginSuccess(User user);
  void onLoginError(String errorTxt);
}

class LoginPresenter {
  LoginContract _view;
  UserLogin api = new UserLogin();
  LoginPresenter(this._view);

  doLogin(String username, String password) {
    api.login(username, password).then((User user) {
      _view.onLoginSuccess(user);
    }).catchError((e) {
      _view.onLoginError('error');
    });
  }
}
