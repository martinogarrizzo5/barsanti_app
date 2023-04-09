import 'package:barsanti_app/data/dio_config.dart';
import 'package:barsanti_app/data/models/home_data/home_data.dart';
import 'package:barsanti_app/data/models/news/news.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NewsRepository {
  final _dio = Dio(dioBaseConfig);

  Future<HomeData> getHomeData() async {
    final response = await _dio.get("/news/home");
    return HomeData.fromJson(response.data);
  }

  Future<News> getNewsById(int id) async {
    final response = await _dio.get("/news/$id");
    return News.fromJson(response.data);
  }

  Future<List<News>> getNews({
    String? search,
    int? category,
    DateTime? startDate,
    DateTime? endDate,
    int? page,
    int? newsCursor, // for infinite scroll
    List<int>? ids,
  }) async {
    final response = await _dio.get("/news", queryParameters: {
      if (search != null && search.isNotEmpty) "search": search,
      if (category != null) "category": category,
      if (startDate != null) "startDate": startDate,
      if (endDate != null) "endDate": endDate,
      if (page != null) "page": page,
      if (ids != null && ids.isNotEmpty) "ids": ids.join(","),
      if (ids?.isEmpty == true) "ids": "0",
    });

    return (response.data as List)
        .map((e) => News.fromJson(e))
        .toList(growable: false);
  }
}
