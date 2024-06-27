import 'package:flutter/material.dart';
import 'package:mobile/components/controls/button.dart';
import 'package:mobile/components/controls/text_input.dart';
import 'package:mobile/constants/spacing.dart';
import 'package:mobile/models/player.dart';
import 'package:mobile/screens/game_screen.dart';
import 'package:mobile/state/game_state.dart';
import 'package:mobile/state/user_state.dart';
import 'package:provider/provider.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void createGame() {
      var user = Provider.of<UserState>(context, listen: false).user;
      Provider.of<GameState>(context, listen: false).createGame(
          Player(id: user.id, name: user.name, value: "pink guitare"));

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const GameScreen()));
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            title: const Text('WHAT THE F*** IS THAT?'),
          ),
          body: Padding(
              padding: const EdgeInsets.all(Spacing.screenPadding),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Your user username is',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: Consumer<UserState>(
                        builder: (context, user, _) => Text(user.user.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold))),
                  ),
                  TextInput(
                      label: 'Name',
                      initialValue:
                          Provider.of<UserState>(context, listen: false)
                              .user
                              .name,
                      onChanged: Provider.of<UserState>(context, listen: false)
                          .setUserName),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Button(
                      type: ButtonTypes.primary,
                      title: 'Create Game',
                      icon: Icons.arrow_forward,
                      onPressed: createGame,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Button(
                      type: ButtonTypes.primary,
                      title: 'Back',
                      icon: Icons.arrow_back,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              )))),
    );
  }
}
