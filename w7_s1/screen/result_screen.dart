import 'package:flutter/material.dart';
import '../model/quiz.dart';
import '../model/Submission.dart';

//Result screen needs to added with Decoration()Circle correct Answer , To be continued....


class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.onRestart,
    required this.submission,
    required this.quiz,
  });

  final VoidCallback onRestart;
  final Submission submission;
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Your score: ${submission.getScore()} / ${quiz.questions.length}',
          style: Theme.of(context).textTheme.headlineSmall, // Updated to headlineSmall
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: onRestart,
          child: const Text('Restart Quiz'),
        ),
      ],
    );
  }
}
