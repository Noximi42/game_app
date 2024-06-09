import 'package:flutter/material.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/components/text_input.dart';

class LobbyScreen extends StatelessWidget {
  const LobbyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        title: const Text('WHAT THE F*** IS THAT?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Lobby Screen'),
            const TextInput(label: 'Name'),
            Button(
              type: ButtonTypes.primary,
              title: 'Back',
              icon: Icons.arrow_back,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
