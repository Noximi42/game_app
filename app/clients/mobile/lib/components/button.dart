import 'package:flutter/material.dart';

enum ButtonTypes {
  primary,
  accent,
}

class Button extends StatelessWidget {
  final ButtonTypes type;
  final String title;
  final VoidCallback onPressed;
  const Button(
      {super.key,
      required this.type,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: theme.colorScheme.secondary,
          backgroundColor: type == ButtonTypes.primary
              ? theme.colorScheme.primary
              : theme.colorScheme.secondary),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
