import 'package:cremation/data/version_data.dart';
import 'package:cremation/model/version_model.dart';

abstract class VersionContract {
  void onVersionSuccess(Version version);
  void onVersionError(String errorTxt);
}

class VersionPresenter {
  VersionContract _view;
  VersionApp api = new VersionApp();
  VersionPresenter(this._view);

  versionApp() {
    api.versionApp().then((Version version) {
      _view.onVersionSuccess(version);
    }).catchError((e) {
      _view.onVersionError('error');
    });
  }
}
