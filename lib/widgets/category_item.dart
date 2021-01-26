import 'package:flutter/material.dart';
import 'package:meals_app/screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String name, id;
  final Color color;
  const CategoryItem({
    this.name,
    this.color,
    this.id,
  });
  void selcetCtegory(BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName, arguments: {
      'id': id,
      'title': name,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selcetCtegory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          name,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [color.withOpacity(.7), color],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          ),
        ),
      ),
    );
  }
}
