import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String label;

  const TextInput({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(), label: Text(label)));
  }
}
