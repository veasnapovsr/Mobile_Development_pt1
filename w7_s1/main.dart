import 'package:flutter/material.dart';
import 'quiz_app.dart';
import 'model/quiz.dart';

void main() {
  Question q1 = const Question(
      title: "What is  Cambodia known for?",
      possibleAnswers: ["Eiffel Tower", "Angkor wat", 'Pyramid'],
      goodAnswer: 'Angkor wat');
  Question q2 = const Question(
      title: "What is the capital city of Cambodia",
      possibleAnswers: ["Hanoi", "Phnom penh", 'Bangkok'],
      goodAnswer: 'Phnom penh');

  List<Question> myQuestions = [q1, q2];
  Quiz myQuiz = Quiz(title: "Crazy Quiz", questions: myQuestions);

  runApp(QuizApp(myQuiz));
}


