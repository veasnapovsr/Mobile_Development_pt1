import 'quiz.dart'; // Import the correct Question and Quiz classes

class Submission {
  final Map<Question, String> answers = {}; // Store user answers for each Question

  // Add the user's answer for a specific question
  void addAnswer(Question question, String answer) {
    answers[question] = answer;
  }

  // Remove all answers (reset the submission)
  void removeAnswers() {
    answers.clear();
  }

  // Calculate the score based on the user's answers
  int getScore() {
    // Count how many answers are correct
    return answers.entries
        .where((entry) => entry.value == entry.key.goodAnswer)
        .length;
  }
}
