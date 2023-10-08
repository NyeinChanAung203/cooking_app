enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordablity {
  cheap,
  expensive,
  luxurious,
}

class Meal {
  final String id;
  final String title;
  final String imgURL;
  final List<String> categories;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final bool isGluton;
  final bool isLuctose;
  final bool isVegan;

  const Meal({
    required this.id,
    required this.title,
    required this.imgURL,
    required this.categories,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.complexity,
    required this.isGluton,
    required this.isLuctose,
    required this.isVegan,
  });
}
