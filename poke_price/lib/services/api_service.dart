import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cart_model.dart';

class ApiService {
  Future<List<CardModel>> fetchCards(String query) async {
    final url = Uri.parse(
        "https://api.pokemontcg.io/v2/cards?q=name:$query"
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final items = data['data'];

      return items.map<CardModel>((item) {
        return CardModel.fromJson(item);
      }).toList();

    } else {
      throw Exception("Failed to fetch data");
    }
  }
}