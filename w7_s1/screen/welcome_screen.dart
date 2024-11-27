import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    super.key,
    required this.quizTitle,
    required this.onStart,
  });

  final String quizTitle;
  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Welcome to $quizTitle!'),
        ElevatedButton(
          onPressed: onStart,
          child: const Text('Start Quiz'),
        ),
      ],
    );
  }
}
