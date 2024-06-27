import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String label;
  final String? initialValue;
  final Function(String) onChanged;

  const TextInput({
    super.key,
    required this.label,
    this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: TextEditingController()
        ..text = initialValue  ?? '',
      decoration: InputDecoration(
          border: const OutlineInputBorder(), label: Text(label)),
      onChanged: onChanged,
    );
  }
}
