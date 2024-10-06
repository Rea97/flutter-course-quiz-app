import 'package:adv_basics/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswers;

  final void Function() onRestartQuiz;

  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.onRestartQuiz});

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers.first,
        'user_answer': chosenAnswers[i],
        'is_correct': chosenAnswers[i] == questions[i].answers.first,
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final int questionsLength = questions.length;
    final int correctAnswersLength = getSummaryData().where((item) {
      return item['is_correct'] as bool;
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $correctAnswersLength out of $questionsLength questions correctly!',
              style: GoogleFonts.lato(
                fontSize: 20,
                color: const Color.fromARGB(255, 215, 172, 255),
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              icon: const Icon(Icons.refresh),
              onPressed: onRestartQuiz,
              label: const Text('Restart quiz!'),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
