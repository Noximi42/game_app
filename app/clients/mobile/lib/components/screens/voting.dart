import 'package:flutter/material.dart';
import 'package:mobile/components/controls/button.dart';
import 'package:mobile/components/global/player_avatar.dart';
import 'package:mobile/state/game_state.dart';
import 'package:provider/provider.dart';

class Voiting extends StatelessWidget {
  const Voiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Consumer<GameState>(
            builder: (context, state, _) =>
                PlayerAvatar(player: state.activePlayer)),
        const Center(
            child: Text(
          "Am I female?",
          style: TextStyle(fontSize: 25),
        )),
        Column(
          children: [
            Button(
              type: ButtonTypes.primary,
              title: 'True',
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Button(
                type: ButtonTypes.primary,
                title: 'False',
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
