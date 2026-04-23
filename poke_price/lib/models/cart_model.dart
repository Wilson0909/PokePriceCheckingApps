class CardModel {
  final String name;
  final double price;
  final String date;
  final String imageUrl;

  CardModel({
    required this.name,
    required this.price,
    required this.date,
    required this.imageUrl,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      name: json['name'] ?? "Unknown",
      price: (json['cardmarket']?['prices']?['averageSellPrice'] ?? 0.0).toDouble(),
      date: DateTime.now().toString(),
      imageUrl: json['images']?['small'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "price": price,
      "date": date,
      "imageUrl": imageUrl,
    };
  }
}