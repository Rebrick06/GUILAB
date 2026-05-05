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
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16), 
        color: Colors.white, 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    recipe.imagePath,
                    width: 220,
                    height: 140,
                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 16), 

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        recipe.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8), 

                      Row(
                        children: [
                          const Icon(Icons.timer, size: 16),
                          const SizedBox(width: 4), 
                          Text("${recipe.time} min"), 
                          const SizedBox(width: 16), 
                          Text("${recipe.price} kr"),
                        ],
                      ),

                      const SizedBox(height: 8), 
                      Text(
                        recipe.description,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16), 

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ingredienser",
                          style: Theme.of(context).textTheme.titleMedium,
                        ), 
                        const SizedBox(height: 8), 

                        Expanded(
                          child: ListView(
                            children: recipe.ingredients
                              .map((i) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(i.toString()),
                            ))
                            .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 24), 

                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tillagning", 
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 8), 

                        Expanded(
                          child: SingleChildScrollView(
                            child: Text(recipe.instruction),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    
  }
}