import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/constants/assets.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:provider/provider.dart';

class TimeControl extends StatefulWidget {
  const TimeControl({super.key});

  @override
  State<TimeControl> createState() => _TimeControl();
}

class _TimeControl extends State<TimeControl> {
  double _time = 30;

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
    return Column(
      children: [
        Slider(
          value: _time,
          divisions: 20,
          max: 150,
          onChanged: (double value) {
            setState(() {
              _time = value;
              recipeHandler.setMaxTime(_time.toInt());
            });
          },
        ),
        Row(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.only(right: AppTheme.paddingSmall),
              child: Image.asset(Assets.timeIcon, height: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(right: AppTheme.paddingLarge),
              child: Text('${_time.round()} min'),
            ),
          ],
        ),
      ],
    );
  }
}
