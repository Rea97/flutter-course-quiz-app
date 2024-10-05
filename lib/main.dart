import 'package:adv_basics/quiz.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Quiz());
}


// void main(){
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: Container(
//           color: Colors.deepPurple,
//           child: Column(
//             children: [
//               Image.asset('assets/images/quiz-logo.png'),
//               const Text(
//                 'Learn flutter the fun way',
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//                 ),
//               FilledButton(
//                 onPressed: () {},child: Text('Start Quiz'),
//                 style: const ButtonStyle(
//                   backgroundColor: WidgetStatePropertyAll(Colors.deepPurple)
//                 ))
//             ],
//           ) ,
//         )
//       )
//     )
//   );
// }