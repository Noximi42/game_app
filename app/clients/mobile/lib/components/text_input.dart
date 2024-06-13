import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String label;
  final Function(String) onChanged;

  const TextInput({
    super.key,
    required this.label,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
            border: const OutlineInputBorder(), label: Text(label)),
    onChanged: onChanged,);
  }
}
