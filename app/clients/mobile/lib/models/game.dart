import 'package:mobile/database/init.dart';
import 'package:mobile/models/player.dart';
import 'package:sqflite/sqflite.dart';

class Game {
  final String id;
  final List<Player> players;
  final String? activePlayerId;

  const Game({
    required this.id,
    required this.players,
    this.activePlayerId,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
    };
  }

  static Future<Game> getGame() async {
    final db = await AppDatabase.instance.database;
    final List<Map<String, Object?>> gameMap = await db.query('game');

    if (gameMap.isEmpty) {
      return const Game(id: '', players: []);
    }

    return [
      for (final {
            'id': id as String,
          } in gameMap)
        Game(id: id, players: []),
    ][0];
  }

  static Future<void> upsertGame(Game game) async {
    final db = await AppDatabase.instance.database;
    await db.insert(
      'game',
      game.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
