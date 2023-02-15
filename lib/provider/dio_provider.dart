import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider((ref) {
  return Dio(BaseOptions(
    baseUrl: "https://showdigital.in/",
    connectTimeout: 5000,
    receiveTimeout: 100000,
  ));
});
