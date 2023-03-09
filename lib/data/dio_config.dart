import "package:dio/dio.dart";

final dioBaseConfig = BaseOptions(
  baseUrl: "localhost:3000",
  receiveTimeout: const Duration(seconds: 30),
  connectTimeout: const Duration(seconds: 30),
);
