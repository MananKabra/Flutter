import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
int score = 0;
QuizBrain quizBrain = QuizBrain();

void main() {
  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.black,
      body: QuizApp()
    ),
  )
  );
}

class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  void answerCheck({required bool buttonType}) {
    bool correctAnswer = quizBrain.getAnswer();

    setState(() {
      if(quizBrain.isFinished() == true){

        Alert(
          context: context,
          title: 'FINISHED',
          desc: 'Your Score Is $score!!',
        ).show();

        quizBrain.reset();
        score = 0;
        scoreKeeper = [];
      }
      else{
        if (buttonType == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          score++;
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }


    });
  }

  List<Icon> scoreKeeper = [];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Text(
                  quizBrain.getQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              onPressed: () {
                answerCheck(buttonType: true);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                child: Text(
                  "TRUE ",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TextButton(
              onPressed: () {
                answerCheck(buttonType: false);
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 80),
                child: Text(
                  "FALSE",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: scoreKeeper,
          )
        ],
      ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/

/////////////////Trial
//
//
// import 'dart:ffi';
//
// import 'package:flutter/material.dart';
//
// void main() => runApp(const QuizApp());
//
//
//
// class QuizApp extends StatefulWidget {
//   const QuizApp({Key? key}) : super(key: key);
//
//   @override
//   State<QuizApp> createState() => _QuizAppState();
// }
//
// class _QuizAppState extends State<QuizApp> {
//
//   int questionCounter = 0;
//   int answer = 2;
//   int correct = 0;
//
//   List<Icon> scoreKeeper = [
//
//   ];
//
//   List<String> questionsList = [
//     'You can lead a cow down stairs but not up stairs.',
//     'Approximately one quarter of human bones are in the feet.',
//     'A slug\'s blood is green.',
//     'Finished\nYour Score Is'
//   ];
//
//   List<int> questionAnswer = [  //0 for False & 1 for True
//     0,
//     1,
//     1
//   ];
//
//   Text questionText({required questionNo}){
//     return Text(
//       questionsList[questionNo],
//       style: TextStyle(
//         color: Colors.white,
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: Colors.black,
//         body: SafeArea(
//           child: Column(
//             children: [
//               Expanded(
//                 flex: 3,
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 50),
//                     child: questionText(questionNo: questionCounter),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: TextButton(
//                   onPressed: (){
//                     setState(() {
//                       answer = 1;
//                       if(questionCounter<2){
//                         if(questionAnswer[questionCounter] == answer){
//                           correct++;
//                           scoreKeeper.add(Icon(Icons.check,color: Colors.green));
//                         }
//                         else{
//                           scoreKeeper.add(Icon(Icons.close,color: Colors.red));
//                         }
//                         questionCounter++;
//                       }
//
//
//                     });
//                   },
//                   style: TextButton.styleFrom(
//                     backgroundColor: Colors.green,
//                   ),
//                   child: Padding(
//                     padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 80),
//                     child: Text(
//                       "TRUE ",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: TextButton(
//                   onPressed: (){
//                     setState(() {
//                       answer = 0;
//                       if(questionCounter<2){
//                         if(questionAnswer[questionCounter] == answer){
//                           correct++;
//                           scoreKeeper.add(Icon(Icons.check,color: Colors.green));
//                         }
//                         else{
//                           scoreKeeper.add(Icon(Icons.close,color: Colors.red));
//                         }
//                         questionCounter++;
//                       }
//                     });
//                   },
//                   style: TextButton.styleFrom(
//                     backgroundColor: Colors.red,
//                   ),
//                   child: Padding(
//                     padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 80),
//                     child: Text(
//                       "FALSE",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 20
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: scoreKeeper,
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
