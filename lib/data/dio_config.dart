import "package:dio/dio.dart";

final dioBaseConfig = BaseOptions(
  baseUrl: "https://eventiapp.itteam.barsanti.edu.it/api",
  receiveTimeout: const Duration(seconds: 30),
  connectTimeout: const Duration(seconds: 30),
);
