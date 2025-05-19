import 'package:flutter/material.dart';
import '../models/property_model.dart';

class FavoritesProvider extends ChangeNotifier {
  final List<PropertyModel> _favorites = [];

  List<PropertyModel> get favorites => _favorites;

  bool isFavorite(PropertyModel property) {
    return _favorites.any((p) => p.id == property.id);
  }

  void toggleFavorite(PropertyModel property) {
    if (isFavorite(property)) {
      _favorites.removeWhere((p) => p.id == property.id);
    } else {
      _favorites.add(property);
    }
    notifyListeners(); // إعادة بناء الواجهة تلقائيًا
  }
}
