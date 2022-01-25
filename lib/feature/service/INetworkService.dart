import 'package:dio/dio.dart';

import '../model/dictionary_model.dart';

abstract class IDioNetworkService {
  final Dio dio;

  IDioNetworkService(this.dio);

  Future<Dictionary?> getRequest(String language, String searchWord);
}
