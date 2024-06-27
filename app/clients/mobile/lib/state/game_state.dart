import 'package:flutter/material.dart';
import 'package:mobile/models/game.dart';
import 'package:mobile/models/player.dart';

class GameState extends ChangeNotifier {
  Game _game = const Game(id: "", players: []);

  Game get game => _game;

  void createGame(Player player) {
    var testPlayers = [
      const Player(id: "palyer-2", name: "Xerow", value: "house plant"),
      const Player(id: "palyer-3", name: "lerroy", value: "tea"),
      const Player(id: "palyer-4", name: "Minn", value: "knife"),
      const Player(id: "palyer-5", name: "alea", value: "private jet"),
    ];
    _game = Game(id: "d59o", players: [player, ...testPlayers]);
  }

  void setGame(Game game) {
    _game = game;
    notifyListeners();
  }
}
