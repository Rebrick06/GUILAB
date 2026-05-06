import 'package:flutter/material.dart';
import 'package:lab2/model/recipe_database/recipe.dart';
import 'package:lab2/util/cuisine.dart';

class ImageControl extends StatelessWidget {
  final Recipe recipe;
  final double width;
  final double height;
  final double flagSize;

  const ImageControl(this.recipe,{ this.width = 104, this.height = 104, this.flagSize = 24.0, super.key});

  @override
  Widget build(BuildContext context) {
    var square = ClipRect(
      child: Container(
        width: width,
        height: height,
        
        child: FittedBox(fit: BoxFit.cover, child: recipe.image),
      )
    );

    var flagImage = Cuisine.flag(recipe.cuisine, width: flagSize);
    
    return Stack(
      children: [
        square,
        if (flagImage != null)
          Positioned(
            bottom: 8,
            right: 8,
            child: flagImage,  
          )
      ]
    );
  }
}