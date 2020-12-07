import 'package:cremation/data/token_data.dart';
import 'package:cremation/model/token_model.dart';

abstract class TokenContract {
}

class TokenPresenter {
  TokenContract _view;
  TokenPresenter(this._view);
  Token api = new Token();

  requestToken(String refreshToken) {
    String refreshToken = 'ad4d5a9114e33348a8f6bae7ae5136ca1b9bf38f';
    api.tokens(refreshToken).then((RequestToken token) {
      print(token);
    }).catchError((e) {
      print(e);
    });
  }
}
