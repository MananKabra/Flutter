import 'package:flutter/material.dart';
import 'input_page.dart';
import 'icon_content.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(  //To change certain properties of the theme
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff0a0e21),
        ),
        scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
      debugShowCheckedModeBanner: false,
      home: InputPage(),
    );
  }
}


