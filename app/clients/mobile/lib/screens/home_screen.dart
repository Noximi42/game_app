import 'package:flutter/material.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/constants/spacing.dart';
import 'package:mobile/screens/lobby_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Button(
                  type: ButtonTypes.primary,
                  title: AppLocalizations.of(context)!.home_button_create_lobby,
                  icon: Icons.create,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LobbyScreen()));
                  },
                ),
                Padding(
                padding: const EdgeInsets.only(top: 20),
                  child: Button(
                    type: ButtonTypes.primary,
                    title: AppLocalizations.of(context)!.home_button_join_lobby,
                    icon: Icons.login,
                    onPressed: () {
                      print('Join lobby pressed');
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
