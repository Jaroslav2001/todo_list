import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> initDatabase(String sql) async {
  WidgetsFlutterBinding.ensureInitialized();
  return openDatabase(
    join(await getDatabasesPath(), 'todo_list.db'),
    onCreate: (db, version) {
      return db.execute(
        sql,
      );
    },
    version: 1,
  );
}
