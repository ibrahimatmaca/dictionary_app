import 'package:dio/dio.dart';

import '../network/network_route.dart';

class DictionaryConstants {
  static DictionaryConstants? _instance;
  static DictionaryConstants get instance {
    _instance ??= DictionaryConstants._init();
    return _instance!;
  }

  DictionaryConstants._init();

  BaseOptions baseOptions = BaseOptions(
    baseUrl: NetworkRoute.BASE_URL.rawValue(),
  );
}
