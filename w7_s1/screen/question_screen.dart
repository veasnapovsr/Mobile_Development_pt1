import 'package:flutter/material.dart';
import '../model/quiz.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen({
    super.key,
    required this.question,
    required this.onTap,
  });

  final Question question;
  final void Function(String answer) onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question.title,
          style: Theme.of(context).textTheme.headlineSmall, // Updated to headlineSmall
        ),
        const SizedBox(height: 20),
        ...question.possibleAnswers.map(
              (answer) => ElevatedButton(
            onPressed: () => onTap(answer),
            child: Text(answer),
          ),
        ),
      ],
    );
  }
}
