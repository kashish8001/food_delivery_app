import 'package:flutter/material.dart';

UserPreferences userPreferences = UserPreferences(
  favoriteCuisine: 'Italian',
  frequentlyOrderedDishes: ['Margherita Pizza', 'Pasta Carbonara'],
  preferredRestaurants: ['Pizza Palace', 'Italiano Bistro'],
  isVegetarian: false,
  prefersSpicyFood: true,
);


class RecommendationBot extends StatelessWidget {
  final UserPreferences userPreferences;

  const RecommendationBot({Key? key, required this.userPreferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recommendation Bot')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hi! What can I help you with today?',
              style: TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              onPressed: () {
                String recommendation = getRecommendation(userPreferences);
                showRecommendationDialog(context, recommendation);
              },
              child: const Text('Get Recommendation'),
            ),
          ],
        ),
      ),
    );
  }

  // String getRecommendation(UserPreferences preferences) {
  //   if (preferences.favoriteCuisine == 'Italian') {
  //     return 'We recommend trying the Margherita Pizza!';
  //   } else if (preferences.orders.contains('Sushi')) {
  //     return 'How about trying the Dragon Roll from Sushi Corner?';
  //   } else {
  //     return 'We suggest the chef\'s special from your nearest restaurant!';
  //   }
  // }

  String getRecommendation(UserPreferences preferences) {
    if (preferences.isVegetarian) {
      return 'We recommend trying the Veggie Supreme Pizza!';
    } else if (preferences.prefersSpicyFood) {
      return 'How about the Spicy Chicken Wings from Hot Bites?';
    } else if (preferences.favoriteCuisine == 'Italian') {
      return 'You might like trying the new Risotto from Italiano Bistro!';
    } else {
      return 'Check out today’s special from your nearest restaurant!';
    }
  }
  void showRecommendationDialog(BuildContext context, String recommendation) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(recommendation),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

// class UserPreferences {
//   final String favoriteCuisine;
//   final List<String> orders;
//
//   UserPreferences({required this.favoriteCuisine, required this.orders});
// }
class UserPreferences {
  String favoriteCuisine;
  List<String> frequentlyOrderedDishes;
  List<String> preferredRestaurants;
  bool isVegetarian;
  bool prefersSpicyFood;

  UserPreferences({
    required this.favoriteCuisine,
    required this.frequentlyOrderedDishes,
    required this.preferredRestaurants,
    this.isVegetarian = false,
    this.prefersSpicyFood = false,
  });
}