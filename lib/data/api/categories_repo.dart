import 'package:barsanti_app/data/dio_config.dart';
import 'package:barsanti_app/data/models/category/category.dart';
import 'package:dio/dio.dart';

class CategoriesRepository {
  final _dio = Dio(dioBaseConfig);

  Future<List<Category>> getCategories() async {
    final response = await _dio.get("/categories");
    return (response.data as List)
        .map((e) => Category.fromJson(e))
        .toList(growable: false);
  }

  Future<Category> getCategory(String id) async {
    final response = await _dio.get("/categories/$id");
    return Category.fromJson(response.data);
  }
}
