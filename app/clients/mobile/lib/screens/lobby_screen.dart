import 'package:flutter/material.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/components/text_input.dart';
import 'package:mobile/constants/spacing.dart';
import 'package:mobile/state/user_state.dart';
import 'package:provider/provider.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
