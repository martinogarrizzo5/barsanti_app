import "package:flutter/material.dart";
import "package:json_annotation/json_annotation.dart";

part "file.g.dart";

@immutable
@JsonSerializable()
class File {
  final int id;
  final String name;
  final String url;

  const File({
    required this.id,
    required this.name,
    required this.url,
  });

  factory File.fromJson(Map<String, dynamic> json) => _$FileFromJson(json);
}
