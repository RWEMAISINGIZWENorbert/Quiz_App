import 'dart:ui';

class QuestionAndAnswer {
  final String Question;
  final List Answers;
  final String CorrectAnswer;
  Color color;

  QuestionAndAnswer(
      {required this.Question,
      required this.Answers,
      required this.CorrectAnswer,
      required this.color});
}
