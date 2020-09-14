import 'package:flutter/material.dart';
import '../Models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(String text, BuildContext context) {
    return Container(
        margin: EdgeInsets.all(5),
        child: Text(text, style: Theme.of(context).textTheme.headline6));
  }

  Widget buildContainer({Widget child}) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      height: 200,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Meal meal = ModalRoute.of(context).settings.arguments as Meal;
    final ScrollController _scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            buildSectionTitle("Ingredients", context),
            buildContainer(
              child: Scrollbar(
                isAlwaysShown: true,
                controller: _scrollController,
                child: ListView.builder(
                  itemCount: meal.ingredients.length,
                  itemBuilder: (ctx, index) => Container(
                    margin: EdgeInsets.all(1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("• " + meal.ingredients[index]),
                    ),
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
            buildSectionTitle("Steps", context),
            buildContainer(
                child: Scrollbar(
              isAlwaysShown: true,
              controller: _scrollController,
              child: ListView.builder(
                itemCount: meal.steps.length,
                itemBuilder: (ctx, index) => Column(children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                      maxRadius: 15.0,
                    ),
                    title: Text(meal.steps[index]),
                  ),
                  Divider(
                    color: Colors.black54,
                  ),
                ]),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
