import 'package:flutter/material.dart';
import 'package:mobile/components/screens/player_lobby.dart';
import 'package:mobile/components/screens/post_question.dart';
import 'package:mobile/components/screens/voting.dart';
import 'package:mobile/constants/spacing.dart';
import 'package:mobile/state/game_state.dart';
import 'package:provider/provider.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text('WHAT THE F*** IS THAT?'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(Spacing.screenPadding),
            child: Consumer<GameState>(builder: (context, gameState, _) {
              if (gameState.game.activePlayerId == null) {
                return const PlayerLobby();
              }
              if (gameState.game.activePlayerId == "user-1") {
                return const PostQuestion();
              }
              return const Voiting();
            })));
  }
}
