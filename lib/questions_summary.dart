import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((item) {
            return Row(
              children: [
                Text(((item['question_index'] as int) + 1).toString()),
                Expanded(
                  child: Column(children: [
                    Text(item['question'] as String),
                    const SizedBox(height: 10,),
                    Text(item['user_answer'] as String),
                    Text(item['correct_answer'] as String),
                            
                  ],),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
