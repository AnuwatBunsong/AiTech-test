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
      _view.getProfileError('error');
    });
  }

  updateImageProfile(image) {
    api.updateImageProfile(image).then((response) {
    }).catchError((e) {
    });
  }
}
