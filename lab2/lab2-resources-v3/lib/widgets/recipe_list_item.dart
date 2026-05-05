import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/cuisine.dart';
import 'package:lab2/util/difficulty.dart';
import 'package:lab2/util/main_ingredient.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {required this.onTap, super.key});

  final Recipe recipe;
  final void Function() onTap;
/* 
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: recipe.image,
      title: Text(recipe.name),
      onTap: onTap,
      shape: Border.all(),
    );
  } */

  @override 
  Widget build(BuildContext context) { 
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12), 
        splashColor: Colors.blue.withAlpha(30),
        onTap: onTap,

      
      
      child: Container(
        height: 128,
        child: Row(
          children: [
            _image(recipe), 
            //SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0, top: 8.0, bottom: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(recipe.name, style: TextStyle(
                    fontSize: 20,

                    ),
                  ),
                    Text(
                    recipe.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,  
                  ),
                  Row(children: [ 
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
                    SizedBox(child: Text('${recipe.time} minuter')),
                    SizedBox(width: 6), 
                    SizedBox(child: Text('${recipe.price}kr')),
                    
                  ]), 
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }

  Widget _image(Recipe recipe) {
    var square = ClipRect(
      child: Container(
        width: 104,
        height: 104,
        child: FittedBox(fit: BoxFit.cover, child: recipe.image),
      ),
    ); 

    var flagImage = Cuisine.flag(recipe.cuisine, width: 24.0); 

    return Stack(
      children: [square, Positioned(bottom: 8, right: 8, child: flagImage!)],
    );
  }
}
