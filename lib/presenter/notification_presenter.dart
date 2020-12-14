import 'package:cremation/data/notification_data.dart';
import 'package:cremation/model/notification_model.dart';

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
    dynamic item = {
      'title': 'ข่าวสารประจำวันที่ 24 ก.ค.63',
      'description': ''
    };

    dbNotification.insert(item).then((data) {
      print(data);
    }).catchError((e) {
      print(e);
    });
  }

  void deleteNotification(int id) {

  }
}
