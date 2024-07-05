import 'package:basic/layouts/buttons/cstm_elevated.dart';
import 'package:flutter/material.dart';
import 'package:basic/layouts/gradient_container.dart';
import 'package:basic/model/quiz.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizQuestion extends StatefulWidget {
  const QuizQuestion({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function({required String answer}) onSelectAnswer;

  @override
  State createState() {
    return _QuizQuestion();
  }
}

class _QuizQuestion extends State<QuizQuestion> {
  var currentQuestionIndex = 0;

  void answerQuestion({required String ans}) {
    if(currentQuestionIndex < 5){
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return GradientContainer(
      widgets: <Widget> [
        SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child:Text(
              currentQuestion.getQuestions,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ...currentQuestion.shuffledAnswers.map((answer) {
                  return CstmElevated(
                    answerText: answer,
                    onTap: () {
                      answerQuestion(ans: answer);
                      widget.onSelectAnswer(answer: answer);
                    },
                  );
                }),
              ],
            ),
          )
        )
      ]
    );
  }
}