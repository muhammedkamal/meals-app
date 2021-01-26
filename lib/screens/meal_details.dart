import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';

class MealDeatilsScreen extends StatelessWidget {
  final Function toggleFavourite;
  final Function isFavourite;
  MealDeatilsScreen(this.toggleFavourite, this.isFavourite);
  static const String routeName = '/meal-details';
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: mediaQueryData.size.height * .3,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingridents'),
            Center(
              child: buildSection(
                mediaQueryData,
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(selectedMeal.ingredients[index]),
                      ),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
            ),
            buildSectionTitle(context, 'Steps'),
            Center(
              child: buildSection(
                mediaQueryData,
                ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        ListTile(
                          leading: CircleAvatar(
                            child: Text('# ${index + 1}'),
                          ),
                          title: Text(selectedMeal.steps[index]),
                        ),
                        Divider()
                      ],
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavourite(mealId),
        child: Icon(isFavourite(mealId) ? Icons.star : Icons.star_border),
      ),
    );
  }

  Container buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Container buildSection(MediaQueryData mediaQueryData, Widget child) {
    return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        height: mediaQueryData.size.height * .25,
        width: mediaQueryData.size.width * .8,
        child: child);
  }
}
