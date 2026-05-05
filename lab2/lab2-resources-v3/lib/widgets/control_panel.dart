
import 'package:flutter/material.dart';
import 'package:lab2/widgets/difficulty_control.dart';
import 'package:lab2/widgets/ingredient_control.dart';
import 'package:lab2/widgets/kitchen_control.dart';
import 'package:lab2/widgets/price_control.dart';
import 'package:lab2/widgets/time_control.dart';

class ControlPanel extends StatelessWidget {
  Widget build

   Widget _controlPanel(context, {double width = 320}) {
    return Container(
      width: width,
      color: const Color.fromARGB(255, 193, 210, 218),
      child: Column(
        children: [
          Title(color: Colors.black, child: Text("Receptsök")),
          Text(
            "Hitta ett recept som passar genom att ändra instälningarna nedanför",
          ),
          IngredientControl(),
          KitchenControl(),
          Column(children: [Text("Svårighetsgrad"), DifficultyControl()]),
          Column(children: [Text("Maxpris:"), PriceControl()]),
          Column(children: [Text("Maxtid:"), TimeControl()]),
        ],
      ),
    );
  }
}