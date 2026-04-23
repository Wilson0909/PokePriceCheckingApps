import 'package:flutter/material.dart';
import '../models/cart_model.dart';
import '../services/api_service.dart';
import '../services/cache_service.dart';

class CardProvider with ChangeNotifier {
  List<CardModel> cards = [];
  bool isLoading = false;
  String? error;

  final api = ApiService();
  final cache = CacheService();

  Future<void> search(String query) async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final result = await api.fetchCards(query);

      cards = result;

      await cache.save("cards", result.map((e) => e.toJson()).toList());
    } catch (e) {
      final cached = await cache.load("cards");

      if (cached != null) {
        cards = cached.map<CardModel>((e) => CardModel.fromJson(e)).toList();
      } else {
        error = "No internet & no cached data.Please Check Your Connection";
      }
    }

    isLoading = false;
    notifyListeners();
  }
}