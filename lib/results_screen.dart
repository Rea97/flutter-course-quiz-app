import 'package:adv_basics/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  
  final void Function() onRestartQuiz;

  const ResultsScreen({super.key, required this.chosenAnswers, required this.onRestartQuiz});

  List<Map<String,Object>> getSummaryData() {
    List<Map<String,Object>> summary = [];

    for(var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers.first,
        'user_answer': chosenAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final int questionsLength = questions.length;
    final int correctAnswersLength = getSummaryData().where((item){
      return item['user_answer'] == item['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered $correctAnswersLength out of $questionsLength questions correctly!'),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(getSummaryData()),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: onRestartQuiz,
              child: const Text('Restart quiz'),
            )
          ],
        ),
      ),
    );
  }
}
