import 'package:basic/model/quiz.dart';
import 'package:basic/quiz_app/quiz_question.dart';
import 'package:basic/quiz_app/result_screen.dart';
import 'package:basic/quiz_app/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({
    super.key
  });

  @override
  State createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  final List<String> selectedAnswers = [];

  void setScreen() {
    resetAnswer();
    setState(() {
      activeScreen = QuizQuestion(onSelectAnswer: chooseAnswer);
    });
  }

  void resetAnswer() {
    selectedAnswers.clear();
  }

  void chooseAnswer({required String answer}) {
    selectedAnswers.add(answer);
    if(selectedAnswers.length >= questions.length){
      setState(() {
        activeScreen =  ResultScreen(restartQuiz: setScreen, answerList: selectedAnswers,);
      });
    }
  }

  @override
  void initState() {
    activeScreen = StartScreen(startQuiz: setScreen, resetAnswer: resetAnswer,);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return activeScreen!;
  }
}