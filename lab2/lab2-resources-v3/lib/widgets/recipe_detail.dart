import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context, listen: false);

    return Container(
      child: Row(
        children: [
          SizedBox(width: 200, height: 200, child: recipe.image),
          Text(recipe.name),
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              uiController.deselectRecipe();
            },
          ),
        ],
      ),
    );
  }
}
