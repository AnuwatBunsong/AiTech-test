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

  getProfile(String token) {
    api.getProfile(token).then((Profile profile) {
      _view.getProfileSuccess(profile);
    }).catchError((e) {
      print(e);
      _view.getProfileError('error');
    });
  }
}

abstract class UpdateProfileContract {
  void updateProfileSuccess(response);
  void updateProfileError(String errorTxt);
}

class UpdateProfilePresenter {
  UpdateProfileContract _view;
  GetProfile api = new GetProfile();
  UpdateProfilePresenter(this._view);

  updateImageProfile(String token, image) {
    api.updateImageProfile(token, image).then((response) {
      _view.updateProfileSuccess(response);
    }).catchError((e) {
      _view.updateProfileError('error');
    });
  }
}
