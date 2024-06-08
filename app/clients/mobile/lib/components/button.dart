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
  final IconData? icon;
  final VoidCallback onPressed;
  const Button(
      {super.key,
      required this.type,
      this.color = AppColors.red,
      required this.title,
      this.icon,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final textColor = type == ButtonTypes.primary
        ? theme.colorScheme.secondary
        : Colors.white;

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor:
              type == ButtonTypes.primary ? theme.colorScheme.primary : color),
      onPressed: onPressed,
      label: Text(title),
      icon: icon != null
          ? Icon(
              icon,
              color: textColor,
            )
          : null,
    );
  }
}
