import 'package:flutter/material.dart';

import '../Models/meal.dart';
import '../Models/category.dart';
import '../Data/dummy-data.dart';
import '../Widgets/Meal_Item/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final Category category;
  // CategoryMealsScreen({@required this.category});
  // ^ No need for this because we're passing arguments using routes and extracting
  // them using final Category category = ModalRoute.of(context).settings.arguments as Category;

  @override
  Widget build(BuildContext context) {
    //Extract route arguments
    final Category category =
        ModalRoute.of(context).settings.arguments as Category;

    final List<Meal> categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    //Create screen
    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(categoryMeals[index]);
          },
        ),
      ),
    );
  }
}
