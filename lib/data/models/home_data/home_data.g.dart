// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) => HomeData(
      latestNews: (json['latestNews'] as List<dynamic>)
          .map((e) => NewsIntro.fromJson(e as Map<String, dynamic>))
          .toList(),
      highlightedNews: (json['highlightedNews'] as List<dynamic>)
          .map((e) => NewsIntro.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'latestNews': instance.latestNews,
      'highlightedNews': instance.highlightedNews,
    };
