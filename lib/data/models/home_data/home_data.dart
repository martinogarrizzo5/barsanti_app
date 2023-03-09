import "package:barsanti_app/data/models/news/news.dart";
import "package:flutter/material.dart";
import "package:json_annotation/json_annotation.dart";

part "home_data.g.dart";

@JsonSerializable()
@immutable
class HomeData {
  final List<News> latestNews;
  final List<News> highlightedNews;

  const HomeData({
    required this.latestNews,
    required this.highlightedNews,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);
}
