import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  MealItem({
    @required this.id,
    @required this.imageUrl,
    @required this.complexity,
    @required this.affordability,
    @required this.title,
    @required this.duration,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return "Simple";
        break;
      case Complexity.Challenging:
        return "Challenging";
        break;
      case Complexity.Hard:
        return "Hard";
        break;
      default:
        return "Unknow";
        break;
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return "Affordable";
        break;
      case Affordability.Pricey:
        return "Pricey";
        break;
      case Affordability.Luxurious:
        return "Luxurious";
        break;
      default:
        return "Unknow";
        break;
    }
  }

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealDeatilsScreen.routeName, arguments: id)
        .then((result) {
      // if (result != null) removeItem(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54,
                    ),
                    width: MediaQuery.of(context).size.width * .6,
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                color: Colors.pink[100],
              ),
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 5,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 5,
                      ),
                      Text(complexityText),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 5,
                      ),
                      Text(affordabilityText),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
