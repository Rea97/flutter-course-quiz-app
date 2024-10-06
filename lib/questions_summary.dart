import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
            return Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: item['is_correct'] as bool
                          ? const Color.fromARGB(255, 56, 189, 178)
                          : const Color.fromARGB(255, 209, 35, 171),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      ((item['question_index'] as int) + 1).toString(),
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['question'] as String,
                          style: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          item['user_answer'] as String,
                          style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 209, 35, 171)),
                        ),
                        Text(
                          item['correct_answer'] as String,
                          style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 56, 189, 178)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
