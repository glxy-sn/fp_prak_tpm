class Beer {
  final int id;
  final String name;
  final String tagline;
  final String description;
  final String image_url;
  final List<String> ingredients;
  final List<String> foodPairing;
  final String brewersTips;

  Beer({
    required this.id,
    required this.name,
    required this.tagline,
    required this.description,
    required this.image_url,
    required this.ingredients,
    required this.foodPairing,
    required this.brewersTips,
  });

  factory Beer.fromJson(Map<String, dynamic> json) {
    return Beer(
      id: json['id'],
      name: json['name'],
      tagline: json['tagline'],
      description: json['description'],
      image_url: json['image_url'],
      ingredients: List<String>.from(json['ingredients']['hops'].map((i) => i['name'])),
      foodPairing: List<String>.from(json['food_pairing']),
      brewersTips: json['brewers_tips'],
    );
  }
}