import 'package:cremation/model/invoice_model.dart';
import 'package:cremation/data/invoice_data.dart';

abstract class InvoiceContract {
  void onLoadInvoiceComplete(List<Invoice> items);
  void onLoadInvoiceError();
}

class InvoicePresenter {
  InvoiceContract _view;
  InvoiceListRepository api = new InvoiceListRepository();
  InvoicePresenter(this._view);

  int _page = 1;
  int _size = 2;

  void invoiceList() {
    final String token = 'abc';
    api.fetch(token, _page, _size).then((data) {
      _view.onLoadInvoiceComplete(data);
    }).catchError((e) {
      _view.onLoadInvoiceError();
    });
  }
}
