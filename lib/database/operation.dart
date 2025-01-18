// ignore_for_file: avoid_print
import 'package:crud_users/models/user.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class Operation {
  static Future<Database> _database() async {
    return openDatabase(join(await getDatabasesPath(), 'users.db'),
        onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, username TEXT, email TEXT)');
    }, version: 1);
  }

  static Future<int> insert(User user) async {
    Database database = await _database();

    return database.insert('users', user.toMap());
  }

  static Future<List<User>> getAll() async {
    Database database = await _database();

    final List<Map<String, dynamic>> usersMap = await database.query("users");

    for (var user in usersMap) {
      print(user['name']);
    }

    return List.generate(
        usersMap.length,
        (i) => User(
            id: usersMap[i]['id'],
            name: usersMap[i]['name'],
            username: usersMap[i]['username'],
            email: usersMap[i]['email']));
  }
}
