class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;

  final List<String> answers;

  List<String> shuffledAnswers() {
    // final shuffled = List.of(answers);
    // shuffled.shuffle();
    // return shuffled;
    return List.of(answers)..shuffle();
  }
}