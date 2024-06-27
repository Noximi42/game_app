import 'package:flutter/material.dart';
import 'package:mobile/constants/app_colors.dart';
import 'package:mobile/models/player.dart';

class PlayerAvatar extends StatelessWidget {
  final Player player;
  final bool hideValue;
  const PlayerAvatar(
      {super.key,
      required this.player,
      this.hideValue = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration:
              const BoxDecoration(color: AppColors.red, shape: BoxShape.circle),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                player.value, 
                textAlign: TextAlign.center, 
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(player.name),
        )
      ],
    );
  }
}
