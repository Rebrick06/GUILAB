
import 'package:flutter/material.dart';
import 'dart:math';

class logo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Image.asset(Assets.logo, height: 68),
        ),
        Stack(
          children: [
            Text(
              'Recept',
              style: TextStyle(
                color: const Color.fromARGB(255, 3, 28, 58), 
                fontSize: 48,
                fontFamily: 'Monoton' 
              ),
            ),
            Transform.rotate(
              angle: -20 * pi / 180, 
              child: Text(
                'Search', 
                style: TextStyle(
                  fontFamily: 'Pacifico', 
                  fontSize: 64,
                  color: Color(0xFFFFAC33)
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

}