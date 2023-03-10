import "package:dio/dio.dart";

final dioBaseConfig = BaseOptions(
  baseUrl: "http://10.0.2.2:3000/api",
  receiveTimeout: const Duration(seconds: 30),
  connectTimeout: const Duration(seconds: 30),
);
