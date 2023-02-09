import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'card.dart';
import 'icon_content.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

const activeCardColour = Color(0xFF1D1E33);
const inactiveCardColour = Color(0xFF111328);
const bottomContainerColour = Color(0xFFEB1555);
const bottomContainerHeight = 80.0;
const labelTextStyle = TextStyle(color: Color(0xFF8D8E98), fontSize: 18);
const labelTextStyleBold = TextStyle(fontSize: 50, fontWeight: FontWeight.w900);

enum Gender{
  male,
  female,
  none
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender SelectedGender = Gender.none;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('BMI CALCULATOR')),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: CardContainer(
                        onPress: (){
                          setState(() {
                            SelectedGender = Gender.male;
                          });
                        },
                    colour: (SelectedGender == Gender.male) ? activeCardColour: inactiveCardColour,
                    cardChild: GenderCard(
                      gender: 'MALE',
                      genderIcon: FontAwesomeIcons.mars,
                    ),
                  )),
                  Expanded(
                      child: CardContainer(
                        onPress: (){
                          setState(() {
                            SelectedGender = Gender.female;
                          });
                        },
                    colour: (SelectedGender==Gender.female) ? activeCardColour: inactiveCardColour,
                    cardChild: GenderCard(
                      gender: 'FEMALE',
                      genderIcon: FontAwesomeIcons.venus,
                    )
                  )),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: CardContainer(
                        onPress: (){},
                    colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            'HEIGHT',
                          style: labelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(),
                              style: labelTextStyleBold
                            ),
                            Text(
                                'cm',
                              style: labelTextStyle,
                            )
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(  //To only change a few things
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                            thumbColor: Color(0xFFEB1555),
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: Color(0xFF8D8E98),
                            overlayColor: Color(0x29EB1555)
                          ),
                          child: Slider(
                              value: height.toDouble(),
                              min: 120.0,
                              max: 220.0,
                              onChanged: (double newHeight){
                                  setState(() {
                                    height = newHeight.round();
                                  });
                              }),
                        )
                      ],
                    )
                  )),
                ],
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: CardContainer(
                      onPress: (){},
                    colour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: labelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: labelTextStyleBold,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton
                              (icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            RoundIconButton
                              (icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    )
                  ),
                ),
                Expanded(
                    child: CardContainer(
                        onPress: (){},
                  colour: activeCardColour,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: labelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: labelTextStyleBold,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age;
                                });
                              }),
                          SizedBox(width: 10),
                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      )
                    ],
                  )
                )),
              ],
            )),
            GestureDetector(
              onTap: (){

                CalculatorBrain calc = CalculatorBrain(weight: weight, height: height);

                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  );
                }));
              },
              child: Container(
                child: Center(child: Text('CALCULATE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)),
                color: bottomContainerColour,
                height: bottomContainerHeight,
                width: double.infinity,
                margin: EdgeInsets.only(top: 10),
              ),
            )
          ],
        ));
  }
}



class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon,required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 6,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      onPressed: onPressed,
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}




// Column(
// children: [
// Expanded(child: Row(
// children: [
// Container(
// margin: EdgeInsets.all(15),
// decoration: BoxDecoration(
// color: Color(0xFF1D1E33),
// borderRadius: BorderRadius.circular(10.0)
// ),
// ),
// Container(
// margin: EdgeInsets.all(15),
// decoration: BoxDecoration(
// color: Color(0xFF1D1E33),
// borderRadius: BorderRadius.circular(10.0)
// ),
// )
// ],
// ),
// ),
// Expanded(child: Row(
// children: [
// Container(
// margin: EdgeInsets.all(15),
// decoration: BoxDecoration(
// color: Color(0xFF1D1E33),
// borderRadius: BorderRadius.circular(10.0)
// ),
// )
// ],
// )),
// Expanded(child: Row(
// children: [
// Container(
// margin: EdgeInsets.all(15),
// decoration: BoxDecoration(
// color: Color(0xFF1D1E33),
// borderRadius: BorderRadius.circular(10.0)
// ),
// ),
// Container(
// margin: EdgeInsets.all(15),
// decoration: BoxDecoration(
// color: Color(0xFF1D1E33),
// borderRadius: BorderRadius.circular(10.0)
// ),
// ),
// ],
// ))
//
// ],
// )
