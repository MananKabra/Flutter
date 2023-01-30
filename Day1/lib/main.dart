import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(   //Basis Container for all the other widgets
    debugShowCheckedModeBanner: false, //To turn off the debug banner
    home: Scaffold(    //For common items like navbar, body, buttons, etc.
      appBar: AppBar(  //Ap Bar is a widget
        title: Center(child: Text("I am Rich")),
        backgroundColor: Colors.black,
      ),
      body: Center(  //Adding an image in the center of the body
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('images/diamond.png')),
          )),
      backgroundColor: Colors.grey,
    ),
  ),
  );
}


