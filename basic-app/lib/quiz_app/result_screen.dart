import 'package:basic/quiz_app/summary_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:basic/layouts/gradient_container.dart';
import 'package:basic/model/quiz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.restartQuiz, required this.answerList});
  
  final void Function() restartQuiz;
  final List<String> answerList;

  List<Map<String, Object>> get getSummaryData {
    final List<Map<String, Object>> summary = [];

    for(var i = 0; i < answerList.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].questions,
        'correct_answer': questions[i].answers[0],
        'chosen_answer': answerList[i]
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = getSummaryData.where((data) => data['correct_answer'] == data['chosen_answer']).length;

    return GradientContainer(
      widgets: <Widget> [
        SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.only(left: 30, right: 30),
            child: Column (
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "You've answered $numCorrectQuestions out of $numTotalQuestions questions correctly", 
                  style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 400,
                  child: SingleChildScrollView(
                    child: SummaryData(summary: getSummaryData)
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                  onPressed: restartQuiz, 
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                    shadowColor: Colors.white,  
                    backgroundColor: const Color.fromARGB(255, 30, 136, 229),
                  ),
                  icon: const Icon(Icons.restart_alt_rounded),
                  label: Text('Start Quiz', style: GoogleFonts.lato(fontSize: 16))
                  // icon: const Icon(Icons.arrow_right),
                )
              ],
            ),
          )
        )
      ]
    );
  }
}