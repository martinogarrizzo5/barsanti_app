import 'package:barsanti_app/data/models/category/category.dart';
import 'package:barsanti_app/data/models/file/file.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@immutable
@JsonSerializable()
class News {
  final int id;
  final String title;
  final String description;
  final bool highlighted;
  final DateTime date;
  final String imageUrl;
  final Category category;
  final List<File> files;

  const News({
    required this.id,
    required this.title,
    required this.description,
    required this.highlighted,
    required this.date,
    required this.imageUrl,
    required this.category,
    required this.files,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);
}
