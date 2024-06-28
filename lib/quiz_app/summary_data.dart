import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SummaryData extends StatelessWidget{
  const SummaryData({super.key, required this.summary});
  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: summary.map((data) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              ((data['question_index'] as int) + 1).toString(), 
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              width:20
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    data['question'] as String, 
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height:5
                  ),
                  Text(
                    data['correct_answer'] as String, 
                    style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 157, 240, 255),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    data['chosen_answer'] as String, 
                    style: GoogleFonts.lato(
                      color: data['correct_answer'] == data['chosen_answer'] ? const Color.fromARGB(255, 157, 255, 201) : const Color.fromARGB(255, 255, 94, 94),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            )
          ],
        );
      }).toList(),
    );
  }
}