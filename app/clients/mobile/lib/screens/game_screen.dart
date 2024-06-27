import 'package:flutter/material.dart';
import 'package:mobile/components/screens/player_lobby.dart';
import 'package:mobile/constants/spacing.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void startGame() {}

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          title: const Text('WHAT THE F*** IS THAT?'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(Spacing.screenPadding),
            child: PlayerLobby(
              onStartGame: startGame,
            )));
  }
}
