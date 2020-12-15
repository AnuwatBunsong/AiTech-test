import 'package:cremation/data/notification_data.dart';
import 'package:cremation/model/notification_model.dart';
import 'package:intl/intl.dart';

abstract class NotificationContract {
  void onLoadNotificationComplete(List<NotificationModel> items);
  void onLoadNotificationError();
}

class NotificationPresenter {
  NotificationContract _view;
  NotificationDataRepository dbNotification = new NotificationDataRepository();
  NotificationPresenter(this._view);

  void notificationList() {
    dbNotification.getData().then((data) {
      _view.onLoadNotificationComplete(data);
    }).catchError((e) {
      _view.onLoadNotificationError();
    });
  }

  void createNotification() {
    final now = new DateTime.now();
    String formatDate = DateFormat('y-M-d H:m:s').format(now);

    dynamic item = {
      'title': 'คุณมียอดค้างชำระเดือน ธ.ค. 63',
      'description': '',
      'created_date': formatDate
    };

    dbNotification.insert(item).then((data) {
      print(data);
    }).catchError((e) {
      print(e);
    });
  }

  void deleteNotification(int id) {
    dbNotification.delete(id).then((data) {
      ///print(data);
    }).catchError((e) {
      ///print(e);
    });
  }
}
