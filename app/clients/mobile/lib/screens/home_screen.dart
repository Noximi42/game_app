import 'package:flutter/material.dart';
import 'package:mobile/components/button.dart';
import 'package:mobile/screens/lobby_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            Button(
              type: ButtonTypes.primary,
              title: 'Create lobby',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LobbyScreen()));
              },
            ),
            Button(
              type: ButtonTypes.primary,
              title: 'Join lobby',
              onPressed: () {
                print('Join lobby pressed');
              },
            ),
          ],
        ),
      ),
    );
  }
}