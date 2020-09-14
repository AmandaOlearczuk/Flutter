import 'package:flutter/material.dart';
import '../../Models/meal.dart';

class MealItemInfo extends StatelessWidget {
  final Meal meal;

  MealItemInfo(this.meal);

  String get _complexityText {
    String complexity = meal.complexity.toString();
    int dotIndex = complexity.indexOf('.');
    return complexity.substring(0, dotIndex);
  }

  String get _affordabilityText {
    String affordability = meal.affordability.toString();
    int dotIndex = affordability.indexOf('.');
    return affordability.substring(0, dotIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.schedule),
                SizedBox(width: 6),
                Text('${meal.duration} min'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.work),
                SizedBox(width: 5),
                Text('$_complexityText'),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.monetization_on),
                SizedBox(width: 6),
                Text('$_affordabilityText '),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
