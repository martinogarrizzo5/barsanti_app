import 'package:barsanti_app/data/api/news_repo.dart';
import 'package:barsanti_app/data/models/news_intro/news_intro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider with ChangeNotifier {
  static const String _favoritesKey = "favorites";

  List<NewsIntro> _favorites = [];
  List<NewsIntro> get favorites => [..._favorites];

  bool _isFetching = false;
  bool get isFetching => _isFetching;

  String? _error;
  String? get error => _error;

  FavoritesProvider() {
    refreshFavorites();
  }

  Future<void> refreshFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final favoriteIds = prefs.getStringList(_favoritesKey);

    _error = null;
    _isFetching = true;
    notifyListeners();

    try {
      final ids = favoriteIds?.map((e) => int.parse(e)).toList() ?? [];
      final newFavorites =
          await GetIt.I.get<NewsRepository>().getNews(ids: ids);
      _favorites =
          newFavorites.map((news) => NewsIntro.fromNews(news)).toList();
      _isFetching = false;
    } catch (err) {
      debugPrint(err.toString());
      _error = err.toString();
      _isFetching = false;
    }

    notifyListeners();
  }

  Future<void> addFavorite(int id) async {
    final prefs = await SharedPreferences.getInstance();

    final newPrefs = prefs.getStringList(_favoritesKey) ?? [];
    newPrefs.add(id.toString());

    await prefs.setStringList(
      _favoritesKey,
      newPrefs,
    );

    notifyListeners();
  }

  Future<void> removeFavorite(int id) async {
    final prefs = await SharedPreferences.getInstance();

    final newPrefs = prefs.getStringList(_favoritesKey) ?? [];
    newPrefs.remove(id.toString());

    _favorites = _favorites.where((element) => element.id != id).toList();
    await prefs.setStringList(
      _favoritesKey,
      newPrefs,
    );

    notifyListeners();
  }

  bool isFavorite(int id) {
    return _favorites.any((element) => element.id == id);
  }
}
