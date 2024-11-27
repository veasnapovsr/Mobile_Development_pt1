import 'package:flutter/material.dart';
import 'model/quiz.dart';
import 'screen/welcome_screen.dart';
import 'screen/question_screen.dart';
import 'screen/result_screen.dart';
import 'model/Submission.dart';

Color appColor = Colors.blue[500] as Color;

enum QuizState { notStarted, started, finished }

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState _quizState = QuizState.notStarted;
  final Submission _submission = Submission();

  void _startQuiz() {
    setState(() {
      _quizState = QuizState.started;
    });
  }

  void _finishQuiz() {
    setState(() {
      _quizState = QuizState.finished;
    });
  }

  void _restartQuiz() {
    setState(() {
      _quizState = QuizState.notStarted;
      _submission.removeAnswers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: Builder(
            builder: (context) {
              switch (_quizState) {
                case QuizState.notStarted:
                  return WelcomeScreen(
                    quizTitle: widget.quiz.title,
                    onStart: _startQuiz,
                  );
                case QuizState.started:
                  return QuestionScreen(
                    question: widget.quiz.questions.first,
                    onTap: (answer) {
                      _submission.addAnswer(widget.quiz.questions.first, answer);
                      if (widget.quiz.questions.length > 1) {
                        setState(() {
                          widget.quiz.questions.removeAt(0);
                        });
                      } else {
                        _finishQuiz();
                      }
                    },
                  );
                case QuizState.finished:
                  return ResultScreen(
                    submission: _submission,
                    quiz: widget.quiz,
                    onRestart: _restartQuiz,
                  );
                default:
                  return const Text("Unexpected state");
              }
            },
          ),
        ),
      ),
    );
  }
}
