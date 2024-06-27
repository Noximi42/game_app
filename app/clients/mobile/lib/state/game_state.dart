import 'package:flutter/material.dart';
import 'package:mobile/models/game.dart';
import 'package:mobile/models/player.dart';

class GameState extends ChangeNotifier {
  Game _game = const Game(id: "", players: []);

  Game get game => _game;
  Player get activePlayer =>
      game.players.firstWhere((p) => p.id == game.activePlayerId);

  void createGame(Player player) {
    var testPlayers = [
      const Player(id: "palyer-2", name: "Xerow", value: "house plant"),
      const Player(id: "palyer-3", name: "lerroy", value: "tea"),
      const Player(id: "palyer-4", name: "Minn", value: "knife"),
      const Player(id: "palyer-5", name: "alea", value: "private jet"),
    ];
    _game = Game(id: "d59o", players: [player, ...testPlayers]);
  }

  void startGame() {
    if (game.players.isEmpty) {
      return;
    }

    setGame(Game(
        id: game.id,
        players: game.players,
        activePlayerId: game.players[1].id));
  }

  void setGame(Game game) {
    _game = game;
    notifyListeners();
  }
}
