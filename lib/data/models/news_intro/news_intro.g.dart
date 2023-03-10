// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_intro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsIntro _$NewsIntroFromJson(Map<String, dynamic> json) => NewsIntro(
      id: json['id'] as int,
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      imageUrl: json['imageUrl'] as String,
      category:
          CategoryIntro.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewsIntroToJson(NewsIntro instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'date': instance.date.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'category': instance.category,
    };
