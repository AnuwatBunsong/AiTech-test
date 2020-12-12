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

  void invoiceList(status, token, page, size) {
    api.fetch(status, token, page, size).then((data) {
      _view.onLoadInvoiceComplete(data);
    }).catchError((e) {
      _view.onLoadInvoiceError();
    });
  }
}
