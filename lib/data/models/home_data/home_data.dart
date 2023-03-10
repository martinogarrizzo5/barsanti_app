import "package:barsanti_app/data/models/news_intro/news_intro.dart";
import "package:flutter/material.dart";
import "package:json_annotation/json_annotation.dart";

part "home_data.g.dart";

@JsonSerializable()
@immutable
class HomeData {
  final List<NewsIntro> latestNews;
  final List<NewsIntro> highlightedNews;

  const HomeData({
    required this.latestNews,
    required this.highlightedNews,
  });

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);
}
