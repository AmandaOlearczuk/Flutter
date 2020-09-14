import 'package:flutter/material.dart';

import 'Screens/categories_screen.dart';
import 'Screens/category_meals_screen.dart';
import 'Screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: '/',
      routes: {
        '/': (ctx) => CategoriesScreen(),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },

      //Generate this route for any route that's not registered under "routes"
      /*
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen();
      },*/

      // Executes when route was failed to be found using routes: and onGenerateRoute:
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },

      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: TextTheme(
            headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      ),
      //home: CategoriesScreen(),
    );
  }
}
