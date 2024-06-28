import 'package:flutter/material.dart';
import 'package:basic/layouts/gradient_container.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({
    super.key,
    required this.startQuiz,
    required this.resetAnswer,
  });

  final void Function() startQuiz;
  final void Function() resetAnswer;

  @override
  Widget build(BuildContext context) {
    resetAnswer;
    return GradientContainer(
      widgets: <Widget> [
        const Image(
          image: AssetImage('assets/images/quiz-logo.png'), 
          height: 200,
          color: Color.fromARGB(175, 255, 255, 255),
        ),
        const SizedBox(
          height: 20
        ),
        Text(
          'Learn Flutter the Fun Way!',
          style: GoogleFonts.lato(
            color: Colors.white,
            fontSize: 20
          ),
        ),
        const SizedBox(
          height: 20
        ),
        ElevatedButton.icon(
          onPressed: startQuiz, 
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            shadowColor: Colors.white,  
            backgroundColor: const Color.fromARGB(255, 30, 136, 229),
          ),
          icon: const Icon(Icons.arrow_right),
          label: Text('Start Quiz', style: GoogleFonts.lato(fontSize: 16))
          // icon: const Icon(Icons.arrow_right),
        )
      ]
    );
  }
}