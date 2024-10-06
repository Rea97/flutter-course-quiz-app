import 'package:adv_basics/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  String screen = 'start_screen';
  // Widget? screen;

  // @override
  // void initState() {
  //   super.initState();
  //   screen = StartScreen(changeScreen);
  // }

  // void changeScreen(){
  //   setState(() {
  //     screen = const QuestionsScreen();
  //   });
  // }

  void changeScreen() {
    setState(() {
      screen = 'questions_screen';
    });
  }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        // selectedAnswers = [];
        screen = 'results_screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      screen = 'questions_screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child = StartScreen(changeScreen);

    if (screen == 'questions_screen') {
      child = QuestionsScreen(onSelectAnswer: selectAnswer);
    }

    if (screen == 'results_screen') {
      child = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 78, 13, 151),
              Color.fromARGB(255, 107, 15, 168)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: child,
        ),
      ),
    );
  }
}
