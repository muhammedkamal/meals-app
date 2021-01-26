import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';
  final List<Meal> meals;
  CategoryMealsScreen(this.meals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryTitle = args['title'];
    displayedMeals = widget.meals.where((meal) {
      return meal.categories.contains(args['id']);
    }).toList();
    super.didChangeDependencies();
  }

  void removeItem(String id) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeals[index].id,
            affordability: displayedMeals[index].affordability,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
