import 'package:mvvm_architecture_flutter/data/network/BaseApiService.dart';
import 'package:mvvm_architecture_flutter/data/network/NetworkApiService.dart';
import 'package:mvvm_architecture_flutter/res/app_url.dart';

class AuthRepo {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = _apiService.getPostApiResponse(AppUrl.loginUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response =
          _apiService.getPostApiResponse(AppUrl.registerApiUrl, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
