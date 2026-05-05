import 'package:flutter/material.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/model/recipe_database/ingredient.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:provider/provider.dart';

class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppTheme.paddingMedium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _leftSection(),

            SizedBox(width: AppTheme.paddingMedium),

            Expanded(
              child: _rightSection(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _leftSection() {
    return SizedBox(
      width: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _imageWithFlag(),

          SizedBox(height: 12), 

          Text("Ingredienser", style: AppTheme.smallHeading), 

          SizedBox(height: 4), 

          ...recipe.ingredients.map(
            (i) => Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Text(i.toString()), 
              )
          )
        ],
      ),
    );
  } 

  Widget _rightSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recipe.name,
            style: AppTheme.largeHeading,
          ),

          SizedBox(height: 8),

          _metaRow(), 

          SizedBox(height: 12),

          Text(recipe.description),

          SizedBox(height: 16),

          Text("Tillagning", style: AppTheme.smallHeading),

          SizedBox(height: 4), 

          Text(recipe.instruction), 
        ],
      ),
    );
  }

  Widget _metaRow() {
    return Row(
      children: [
        Icon(Icons.timer, size: 16),
        SizedBox(width: 4),
        Text('${recipe.time} min'),
        SizedBox(width: 12),

        Icon(Icons.attach_money, size: 16),

        Text('${recipe.price} kr'),
      ],
    );
  }

  Widget _ingredients() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: recipe.ingredients.map((i) => Text(i.toString())).toList(),
    );
  }

  Widget _imageWithFlag() {
    var flag = Cuisine.flag(recipe.cuisine, width: 60); 

    return Stack(
      children: [
        SizedBox(
          width: 240,
          height: 240,
          child: FittedBox(
            fit: BoxFit.cover,
            child: recipe.image,
          ),
        ),
        if (flag != null)
          Positioned(
            bottom: 8,
            right: 8,
            child: flag,
            ),
      ],
    );

  }

}
