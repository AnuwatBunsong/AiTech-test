import 'package:cremation/data/profile_data.dart';
import 'package:cremation/model/profile_model.dart';

abstract class ProfileContract {
  void getProfileSuccess(Profile profile);
  void getProfileError(String errorTxt);
}

class ProfilePresenter {
  ProfileContract _view;
  GetProfile api = new GetProfile();
  ProfilePresenter(this._view);

  doLogin(String username, String password) {
    api.login(username, password).then((Profile profile) {
      _view.getProfileSuccess(profile);
    }).catchError((e) {
      _view.getProfileError('error');
    });
  }
}
