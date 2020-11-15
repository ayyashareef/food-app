import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:woodberry/scr/widgets/custom_text.dart';

import 'package:woodberry/commons.dart';

class Category {
  final String name;
  final String image;

  Category({@required this.name, this.image});
}

List<Category> categoriesList = [
  Category(name: "Salad", image: "salad.png"),
  Category(name: "Sandwich", image: "sandwich.png"),
  Category(name: "Main Dish", image: "steak.png"),
  Category(name: "Drink", image: "drink.png"),
    Category(name: "Dessert", image: "salad.png"),
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoriesList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(color: white, boxShadow: [
                      BoxShadow(
                          color: grey, offset: Offset(4, 6), blurRadius: 5),
                    ]),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child:
                          Image.asset("images/${categoriesList[index].image}"),
                    ),
                    width: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text: categoriesList[index].name,
                      size: 14,
                      color: black,
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }
}
