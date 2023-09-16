// ignore_for_file: public_member_api_docs, sort_constructors_first

class Food {
  String foodId;
  String name;
  String imageUrl;
  String description;
  String waitTime;
  String calories;
  double score;
  double price;
  int quantity;
  List<Map<String, String>> ingredients;
  String about;
  bool highLight;
  Food({
    required this.foodId,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.waitTime,
    required this.calories,
    required this.score,
    required this.price,
    required this.quantity,
    required this.ingredients,
    required this.about,
    this.highLight = false,
  });

  static List<Food> getRecommendedFood() {
    return [
      Food(
        foodId: '1',
        name: "Shrimp Scampi Pasta",
        imageUrl: "assets/images/Layer 2.png",
        description: "Delicious shrimp scampi pasta with garlic and white wine sauce.",
        waitTime: "20 minutes",
        calories: "380 kcal",
        score: 4.9,
        price: 14.99,
        quantity: 1,
        ingredients: [
          {"Berries": "assets/images/img1.png"},
          {"Lemmon": "assets/images/img2.png"},
          {"Pinapple": "assets/images/img3.png"},
          {"Banana": "assets/images/img4.png"},
        ],
        about:
            "Treat yourself to our Shrimp Scampi Pasta, featuring succulent shrimp cooked in a flavorful garlic and white wine sauce, served over perfectly cooked pasta.",
        highLight: false,
      ),
      Food(
        foodId: '2',
        name: "Grilled Chicken Salad",
        imageUrl: "assets/images/Layer 2.png",
        description: "A healthy and delicious grilled chicken salad.",
        waitTime: "20 minutes",
        calories: "300 kcal",
        score: 4.5,
        price: 12.99,
        quantity: 1,
        ingredients: [
          {"Berries": "assets/images/img1.png"},
          {"Lemmon": "assets/images/img2.png"},
          {"Pinapple": "assets/images/img3.png"},
          {"Banana": "assets/images/img4.png"},
        ],
        about:
            "Our Grilled Chicken Salad is a healthy and flavorful option for a light meal. Made with tender grilled chicken breast, a mix of fresh greens, cherry tomatoes, cucumber, and drizzled with balsamic vinaigrette dressing.",
        highLight: false,
      ),
      Food(
        foodId: '3',
        name: "Vegetable Curry",
        imageUrl: "assets/images/Layer 2.png",
        description: "A comforting and aromatic vegetable curry with basmati rice.",
        waitTime: "25 minutes",
        calories: "300 kcal",
        score: 4.4,
        price: 10.99,
        quantity: 1,
        ingredients: [
          {"Berries": "assets/images/img1.png"},
          {"Lemmon": "assets/images/img2.png"},
          {"Pinapple": "assets/images/img3.png"},
          {"Banana": "assets/images/img4.png"},
        ],
        about:
            "Experience the flavors of our Vegetable Curry, a delightful blend of mixed vegetables in aromatic curry sauce, served with fragrant basmati rice and warm naan bread.",
        highLight: false,
      ),
      Food(
        foodId: '4',
        name: "BBQ Pulled Pork Sandwich",
        imageUrl: "assets/images/Layer 2.png",
        description: "A mouthwatering BBQ pulled pork sandwich with coleslaw.",
        waitTime: "22 minutes",
        calories: "450 kcal",
        score: 4.7,
        price: 11.99,
        quantity: 1,
        ingredients: [
          {"Berries": "assets/images/img1.png"},
          {"Lemmon": "assets/images/img2.png"},
          {"Pinapple": "assets/images/img3.png"},
          {"Banana": "assets/images/img4.png"},
        ],
        about:
            "Satisfy your cravings with our BBQ Pulled Pork Sandwich, featuring tender pulled pork smothered in BBQ sauce, topped with coleslaw, all served on a toasted brioche bun.",
        highLight: false,
      ),
    ];
  }

  static List<Food> getPopularFood() {
    return [
      Food(
        foodId: '5',
        name: "Margherita Pizza",
        imageUrl: "assets/images/Layer 2.png",
        description: "Classic Margherita pizza with a thin, crispy crust.",
        waitTime: "15 minutes",
        calories: "250 kcal",
        score: 4.8,
        price: 10.99,
        quantity: 1,
        ingredients: [
          {"Berries": "assets/images/img1.png"},
          {"Lemmon": "assets/images/img2.png"},
          {"Pinapple": "assets/images/img3.png"},
          {"Banana": "assets/images/img4.png"},
        ],
        about:
            "Savor the simplicity of our Margherita Pizza, topped with fresh tomato sauce, mozzarella cheese, and aromatic basil leaves. A timeless classic for pizza lovers.",
        highLight: false,
      ),
      Food(
        foodId: '2',
        name: "Grilled Chicken Salad",
        imageUrl: "assets/images/Layer 2.png",
        description: "A healthy and delicious grilled chicken salad.",
        waitTime: "20 minutes",
        calories: "300 kcal",
        score: 4.5,
        price: 12.99,
        quantity: 1,
        ingredients: [
          {"Berries": "assets/images/img1.png"},
          {"Lemmon": "assets/images/img2.png"},
          {"Pinapple": "assets/images/img3.png"},
          {"Banana": "assets/images/img4.png"},
        ],
        about:
            "Our Grilled Chicken Salad is a healthy and flavorful option for a light meal. Made with tender grilled chicken breast, a mix of fresh greens, cherry tomatoes, cucumber, and drizzled with balsamic vinaigrette dressing.",
        highLight: false,
      ),
      Food(
        foodId: '6',
        name: "Vegetarian Sushi Roll",
        imageUrl: "assets/images/Layer 2.png",
        description: "A delightful vegetarian sushi roll with avocado and cucumber.",
        waitTime: "18 minutes",
        calories: "220 kcal",
        score: 4.6,
        price: 9.99,
        quantity: 1,
        ingredients: [
          {"Berries": "assets/images/img1.png"},
          {"Lemmon": "assets/images/img2.png"},
          {"Pinapple": "assets/images/img3.png"},
          {"Banana": "assets/images/img4.png"},
        ],
        about:
            "Indulge in our Vegetarian Sushi Roll filled with creamy avocado and crisp cucumber wrapped in seaweed nori and sushi rice. A healthy and satisfying choice for sushi lovers.",
        highLight: false,
      ),
      Food(
        foodId: '4',
        name: "BBQ Pulled Pork Sandwich",
        imageUrl: "assets/images/Layer 2.png",
        description: "A mouthwatering BBQ pulled pork sandwich with coleslaw.",
        waitTime: "22 minutes",
        calories: "450 kcal",
        score: 4.7,
        price: 11.99,
        quantity: 1,
        ingredients: [
          {"Berries": "assets/images/img1.png"},
          {"Lemmon": "assets/images/img2.png"},
          {"Pinapple": "assets/images/img3.png"},
          {"Banana": "assets/images/img4.png"},
        ],
        about:
            "Satisfy your cravings with our BBQ Pulled Pork Sandwich, featuring tender pulled pork smothered in BBQ sauce, topped with coleslaw, all served on a toasted brioche bun.",
        highLight: false,
      ),
    ];
  }

  static List<Food> getNoodlesFood() {
    return [];
  }

  static List<Food> getPizzasFood() {
    return [];
  }
}
