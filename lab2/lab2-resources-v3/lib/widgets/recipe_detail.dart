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
    var uiController = Provider.of<UIController>(context, listen: false);

    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppTheme.paddingMedium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageSection(),
            SizedBox(width: AppTheme.paddingMedium),
            Expanded(child: _contentSection()),
          ],
        ),
      ),
    );
  }

  Widget _imageSection() {
    var image = SizedBox(
      width: 240,
      height: 240,
      child: FittedBox(fit: BoxFit.cover, child: recipe.image),
    );
    var flag = Cuisine.flag(recipe.cuisine, width: 60);

    return Stack(
      children: [
        image,
        if (flag != null) Positioned(bottom: 8, right: 8, child: flag),
      ],
    );
  }

  Widget _contentSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(recipe.name, style: AppTheme.largeHeding),
        SizedBox(height: 8),
        _metaRow(),

        SizedBox(height: 8),

        Text(recipe.description),
        SizedBox(height: 16),
        Text('ingredienser', style: AppTheme.smallHeading),
        _ingredients(),
      ],
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
}
