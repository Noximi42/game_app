import 'package:mobile/database/init.dart';
import 'package:sqflite/sqflite.dart';

class User {
  final String id;
  final String name;

  const User({
    required this.id,
    required this.name,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  static Future<User> getUser() async {
    final db = await AppDatabase.instance.database;
    final List<Map<String, Object?>> userMap = await db.query('user');

    if (userMap.isEmpty) {
      return const User(id: '', name: '');
    }

    return [
      for (final {
            'id': id as String,
            'name': name as String,
          } in userMap)
        User(id: id, name: name),
    ][0];
  }

  static Future<void> upsertUser(User user) async {
    final db = await AppDatabase.instance.database;
    await db.insert(
      'user',
      user.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
