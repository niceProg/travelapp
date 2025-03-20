class TripModel {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final double originalPrice;
  final double rating;
  final int reviewCount;
  final String location;
  final String summary;
  final List<String> includes;
  final List<String> excludes;
  final String terms;
  final int passengers;

  TripModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.originalPrice,
    required this.rating,
    required this.reviewCount,
    required this.location,
    required this.summary,
    required this.includes,
    required this.excludes,
    required this.terms,
    required this.passengers,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'],
      title: json['title'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
      originalPrice: json['originalPrice'].toDouble(),
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      location: json['location'],
      summary: json['summary'],
      includes: List<String>.from(json['includes']),
      excludes: List<String>.from(json['excludes']),
      terms: json['terms'],
      passengers: json['passengers'],
    );
  }
}
