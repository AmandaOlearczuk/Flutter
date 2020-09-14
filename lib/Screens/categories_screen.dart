import 'package:flutter/material.dart';
import '../Data/dummy-data.dart';
import '../Widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FlashMeals'),
        ),
        body: GridView.builder(
            itemCount: DUMMY_CATEGORIES.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            padding: EdgeInsets.all(2),
            itemBuilder: (context, index) {
              return CategoryItem(
                category: DUMMY_CATEGORIES.elementAt(index),
              );
            }));
  }
}
