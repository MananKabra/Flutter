import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  GenderCard({required this.gender, required this.genderIcon});

  final String gender;
  final IconData genderIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 60,
        ),
        SizedBox(height: 15),
        Text(
          gender,
          style:
          TextStyle(color: Color(0xFF8D8E98), fontSize: 18),
        )
      ],
    );
  }
}
