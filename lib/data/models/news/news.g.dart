// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) => News(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      highlighted: json['highlighted'] as bool,
      date: DateTime.parse(json['date'] as String),
      imageUrl: json['imageUrl'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      files: (json['files'] as List<dynamic>)
          .map((e) => File.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'highlighted': instance.highlighted,
      'date': instance.date.toIso8601String(),
      'imageUrl': instance.imageUrl,
      'category': instance.category,
      'files': instance.files,
    };
