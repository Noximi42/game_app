import 'package:flutter/material.dart';
import 'package:mobile/components/controls/button.dart';
import 'package:mobile/components/global/player_avatar.dart';
import 'package:mobile/state/game_state.dart';
import 'package:provider/provider.dart';

class PlayerLobby extends StatelessWidget {
  const PlayerLobby({super.key});

  @override
  Widget build(BuildContext context) {
    void startGame() {
      Provider.of<GameState>(context, listen: false).startGame();
    }

    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '#${Provider.of<GameState>(context, listen: false).game.id}',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Expanded(
        child: Consumer<GameState>(
            builder: (context, game, _) => GridView.count(
                  crossAxisCount: 2,
                  children: game.game.players
                      .map((p) => PlayerAvatar(player: p))
                      .toList(),
                )),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 40, bottom: 10),
        child: Button(
          type: ButtonTypes.accent,
          title: "Start Game",
          onPressed: startGame,
        ),
      )
    ]);
  }
}
