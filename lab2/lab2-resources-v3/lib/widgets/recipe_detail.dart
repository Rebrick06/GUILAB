import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/ui_controller.dart';
import 'package:lab2/widgets/image_control.dart';
import 'package:lab2/app_theme.dart';
import 'package:lab2/util/main_ingredient.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:provider/provider.dart';


class RecipeDetail extends StatelessWidget {
  const RecipeDetail(this.recipe, {super.key});
  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    var uiController = Provider.of<UIController>(context,listen: false);//Provider.of<UIController>(context, listen: false);
  
    return Center(
      child: Card(
        elevation: 6,
        margin: EdgeInsets.all(AppTheme.paddingLarge),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),

        child: Padding(
          padding: EdgeInsets.all(AppTheme.paddingMedium),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    uiController.deselectRecipe();
                  }
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: AppTheme.paddingHuge),
              
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 240,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ImageControl(
                                recipe,
                                height: 240,
                                width: 240,
                                flagSize: 60,
                              ),
                              SizedBox(height: AppTheme.paddingMedium),
                              Text('Ingredienser', style: AppTheme.smallHeading),
                              if (recipe.servings > 1)
                                Text('${recipe.servings} portioner')
                              else 
                                Text('${recipe.servings} portion'),
                              SizedBox(height: AppTheme.paddingSmall),

                              for (int i = 0; i < recipe.ingredients.length; i++)
                                Padding(
                                  padding: EdgeInsets.only(left: AppTheme.paddingMedium),
                                  child: Text(recipe.ingredients[i].toString()),
                                ),
                            ],
                          )
                        ),

                        SizedBox(width: AppTheme.paddingLarge),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(recipe.name, style: AppTheme.largeHeading),

                              Row(
                                children: [
                                  SizedBox(
                                    width: 18,
                                    child: MainIngredient.icon(recipe.mainIngredient),
                                  ),
                                  SizedBox(width: 4),
                                  SizedBox(
                                    width: 45,
                                    child: Difficulty.icon(recipe.difficulty),
                                  ),
                                  SizedBox(width: 4),
                                  Text('${recipe.time} minuter'),
                                  SizedBox(width: 6),
                                  Text('${recipe.price} kr'),
                                ],
                              ),

                              SizedBox(height: AppTheme.paddingSmall),
                              Text(recipe.description),
                              SizedBox(height: AppTheme.paddingSmall),
                              Text(
                                'Tillagning:',
                                style: AppTheme.smallHeading,
                              ),
                              Text(recipe.instruction),
                            ],
                          )
                        )
                      ],
                    ),
                  ]
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}