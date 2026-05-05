import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/recipe_handler.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:provider/provider.dart';

class DifficultyControl extends StatefulWidget {
  const DifficultyControl({super.key});

  @override
  State<DifficultyControl> createState() => _DifficulyControlState();
}

class _DifficulyControlState extends State<DifficultyControl> {
  String _difficulty = Difficulty.labels[0];

  @override
  Widget build(BuildContext context) {
    var recipeHandler = Provider.of<RecipeHandler>(context, listen: false);
    return RadioGroup<String>(
      groupValue: _difficulty,
      onChanged: (value) {
        setState(() {
          _difficulty = value!;
          recipeHandler.setDifficulty(_difficulty);
        });
      },
      child: Column(
        children: [
          for (final label in Difficulty.labels)
            RadioListTile<String>(
              dense: true,
              title: Row(
                children: [
                  Text(label),
                  SizedBox(width: AppTheme.paddingMedium),
                  if (Difficulty.icons[Difficulty.labels.indexOf(label)] !=
                      null)
                    Difficulty.icons[Difficulty.labels.indexOf(label)]!,
                ],
              ),

              value: label,
            ),
        ],
      ),
    );
  }
}
