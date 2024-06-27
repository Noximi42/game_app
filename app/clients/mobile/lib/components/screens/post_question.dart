import 'package:flutter/material.dart';
import 'package:mobile/components/controls/button.dart';
import 'package:mobile/components/controls/text_input.dart';

class PostQuestion extends StatelessWidget {
  const PostQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    Widget Question(String question, bool correct) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              question,
              style: const TextStyle(fontSize: 20),
            ),
            correct
                ? const Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : const Icon(Icons.cancel, color: Colors.red),
          ],
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Question("Am I female?", true),
              Question("Do I live in nature?", false)
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextInput(
                label: "Your Question",
                onChanged: (v) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SizedBox(
                width: 100,
                child: Button(
                  type: ButtonTypes.primary,
                  title: 'Send',
                  onPressed: () {},
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
