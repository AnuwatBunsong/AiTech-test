import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:cremation/model/notification_model.dart';

class NotificationDataRepository {
  static final NotificationDataRepository _instance =
      new NotificationDataRepository.internal();
  factory NotificationDataRepository() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  NotificationDataRepository.internal();

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "cremation.db");
    var myDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return myDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
        "CREATE TABLE notification(id INTEGER PRIMARY KEY, title TEXT, short_description TEXT, create_date DATETIME)");
  }

  Future<List<NotificationModel>> getData() async {
    var dbClient = await db;
    List<Map> list = await dbClient
        .rawQuery('SELECT * FROM notification order by create_date desc');
    List<NotificationModel> notificationList = new List();
    notificationList = list
        .map((contactRaw) => NotificationModel.fromMap(contactRaw))
        .toList();
    return notificationList;
  }

  Future<int> insert(notification) async {
    var dbClient = await db;
    int res = await dbClient.insert("notification", notification);
    return res;
  }

  Future<int> delete(NotificationModel notification) async {
    var dbClient = await db;

    int res = await dbClient
        .rawDelete('DELETE FROM notification WHERE id = ?', [notification.id]);
    return res;
  }

  Future<bool> update(NotificationModel notification) async {
    var dbClient = await db;
    int res = await dbClient.update("notification", notification.toMap(),
        where: "id = ?", whereArgs: <int>[notification.id]);
    return res > 0 ? true : false;
  }
}
