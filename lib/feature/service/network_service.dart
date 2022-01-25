import 'package:dictionary_app/feature/model/dictionary_model.dart';
import 'package:dictionary_app/feature/util/network/network_route.dart';
import 'package:dio/dio.dart';

import 'INetworkService.dart';

class NetworkService extends IDioNetworkService {
  NetworkService(Dio dio) : super(dio);

  @override
  Future<Dictionary?> getRequest(String language, String searchWord) async {
    try {
      final response = await dio.get(
        NetworkRoute.SEARCH.rawValue(language: language, word: searchWord),
      );
      if (response.statusCode == 200) {
        //print("Response Data:" + response.data.toString());
        final jsonFile = Dictionary.fromJson(response.data[0]);
        return jsonFile;
      }
    } on DioError catch (e) {
      print("Exception1: " + e.message);
      print("Exceeption Uri: " + e.requestOptions.uri.toString());
      return null;
    }
    return null;
  }
}
