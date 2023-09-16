// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:shopperino/data/models/food.dart';

class Restaurant {
  String name;
  String waitTime;
  String distance;
  String label;
  String logoUrl;
  String description;
  num score;
  Map<String, List<Food>> menu;
  Restaurant({
    required this.name,
    required this.waitTime,
    required this.distance,
    required this.label,
    required this.logoUrl,
    required this.description,
    required this.score,
    required this.menu,
  });

  static Restaurant getResturant() {
    return Restaurant(
        name: "Casa Italiano",
        waitTime: "30 minutes",
        distance: "2 miles",
        label: "Italian Cuisine",
        logoUrl: "assets/images/chip.png",
        description: "Casa Italiano offers authentic Italian cuisine with a wide range of pasta, pizza, and more.",
        score: 4.7,
        menu: {
          'Recommended': Food.getRecommendedFood(),
          'Popular': Food.getPopularFood(),
          'Noodles': Food.getNoodlesFood(),
          'Pizzas': Food.getPizzasFood(),
        });
  }
}
