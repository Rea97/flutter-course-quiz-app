import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/models/quiz_question.dart';
import 'package:adv_basics/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentIndex = 0;

  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);

    if (currentIndex == (questions.length - 1)) {
      return;
    }

    setState(() {
      currentIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final QuizQuestion currentQuestion = questions[currentIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 218, 198, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            ...currentQuestion.shuffledAnswers().map((String answer) {
              return AnswerButton(
                label: answer,
                onPressed: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
