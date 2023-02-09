import 'package:flutter/material.dart';
import 'card.dart';
import 'input_page.dart';
import 'main.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage({required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI RESULTS"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Container(
                child: Center(
                  child: Text(
                      'Your Result',
                    style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                  ),
                ),
              )
          ),
          Expanded(
            flex: 5,
              child: CardContainer(
                onPress: (){},
                colour: Color(0xFF1D1E33),
                cardChild: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText,
                        style: TextStyle(
                          color: Color(0xFF24D876),
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        bmiResult,
                        style: TextStyle(
                          fontSize: 100,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        interpretation,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return BMICalculator();
              }));
            },
            child: Container(
              child: Center(child: Text('RE-CALCULATE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
              color: bottomContainerColour,
              height: bottomContainerHeight,
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
            ),
          )
        ],
      ),
    );
  }
}
