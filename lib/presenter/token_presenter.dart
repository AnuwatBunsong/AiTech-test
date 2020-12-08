import 'package:cremation/data/token_data.dart';
import 'package:cremation/model/token_model.dart';

abstract class TokenContract {
  void requestTokenSuccess(RequestToken token);
  void requestTokenError(String errorTxt);
}

class TokenPresenter {
  TokenContract _view;
  TokenPresenter(this._view);
  Token api = new Token();

  requestToken(String refreshToken) async {
    api.tokens(refreshToken).then((RequestToken response) async {
      _view.requestTokenSuccess(response);
    }).catchError((e) {
      _view.requestTokenError('error');
    });
  }
}
