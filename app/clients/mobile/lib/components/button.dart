import 'package:flutter/material.dart';
import 'package:mobile/constants/app_colors.dart';

enum ButtonTypes {
  primary,
  accent,
}

class Button extends StatelessWidget {
  final ButtonTypes type;
  final Color color;
  final String title;
  final VoidCallback onPressed;
  const Button(
      {super.key,
      required this.type,
      this.color = AppColors.red,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          foregroundColor: type == ButtonTypes.primary
              ? theme.colorScheme.secondary
              : Colors.white,
          backgroundColor:
              type == ButtonTypes.primary ? theme.colorScheme.primary : color),
      onPressed: onPressed,
      child: Text(title),
    );
  }
}
