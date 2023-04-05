import 'package:barsanti_app/data/models/category_intro/category_intro.dart';
import 'package:barsanti_app/data/models/news/news.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_intro.g.dart';

@JsonSerializable()
@immutable
class NewsIntro {
  final int id;
  final String title;
  final DateTime date;
  final String imageUrl;
  final CategoryIntro category;

  const NewsIntro({
    required this.id,
    required this.title,
    required this.date,
    required this.imageUrl,
    required this.category,
  });

  factory NewsIntro.fromNews(News news) {
    return NewsIntro(
      id: news.id,
      title: news.title,
      date: news.date,
      imageUrl: news.imageUrl,
      category: CategoryIntro(
        id: news.category.id,
        name: news.category.name,
      ),
    );
  }

  factory NewsIntro.fromJson(Map<String, dynamic> json) =>
      _$NewsIntroFromJson(json);
}
