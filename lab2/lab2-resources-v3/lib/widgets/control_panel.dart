import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/logo.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/time_control.dart';
import 'package:lab2/app_theme.dart';

class ControlPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context, {double width = 320}) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218), 
        child: Padding(
        padding: EdgeInsets.all(AppTheme.paddingMedium),
        child: Column(
          children: [
              Column(children: [Logo()]),
              Text(
                "\nHitta ett recept som passar genom att ändra instälningarna nedanför\n",
              ),
              Padding(padding: EdgeInsets.only(left: 0), child: IngredientControl()),
              Padding(padding: EdgeInsets.only(left: 0), child: KitchenControl()),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("\nSvårighetsgrad"), DifficultyControl()]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Maxpris:"), PriceControl()]),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("Maxtid:"), TimeControl()]),
          ],
        ),
      )
    );
  }
}
