import 'package:barsanti_app/data/models/category/category.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_intro.g.dart';

@JsonSerializable()
@immutable
class CategoryIntro {
  final int id;
  final String name;

  const CategoryIntro({
    required this.id,
    required this.name,
  });

  factory CategoryIntro.fromJson(Map<String, dynamic> json) =>
      _$CategoryIntroFromJson(json);
}
