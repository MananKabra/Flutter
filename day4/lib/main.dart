import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.blue,
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Home",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.blue,
              ),
            ),
            Text(
              "About",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.blue,
              ),
            ),
            Text(
              "Contact",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(
              height: 20,
              width: 150,
              child: Divider(
                color: Colors.blue,
              ),
            ),
            Text(
              "Exit",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Decision Dicee"),
        backgroundColor: Colors.blue[500],
      ),
      body: Dice(),
    ),
  ),
  );
}

int left = 1;   //Variables are used to store values and accessed by $ sign
int right = 1;
Random random = new Random();

void rollDice(){   //Making a function to change the variables
  right = random.nextInt(6)+1;
  left = random.nextInt(6)+1;
}

//Stateful Class is used for widgets we need to change during the running time
class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(  //Takes the max available space and avoides overflow
              flex: 1,  //Like a ratio comparison for other expanded widgets
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextButton(   //Using button to detect click from the user
                    onPressed: (){  //Function to call when clicked
                      print("Left Button Clicked");
                      setState(() {  //This will call the override function and will do the changes in the app
                        rollDice();   //The variable/function changing is to be kept in the setState function
                      });
                    },
                    child: Image.asset('images/dice$left.png')
                ),
              )    //Image constructor used for smaller code
          ),
          Expanded(  //Takes the max available space and avoides overflow
              flex: 1,   //Default value of flex is 1
              child: Padding(
                padding: EdgeInsets.all(10),
                child: TextButton(
                  onPressed: (){
                    print("Right Button Clicked");
                    setState(() {
                      rollDice();
                    });
                  },
                  child: Image.asset('images/dice$right.png'),
                ),
              )    //Image constructor used for smaller code
          ),
        ],
      ),
    );
  }
}




