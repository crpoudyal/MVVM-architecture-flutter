import 'package:mvvm_architecture_flutter/data/network/BaseApiService.dart';
import 'package:mvvm_architecture_flutter/data/network/NetworkApiService.dart';
import 'package:mvvm_architecture_flutter/model/movie_model.dart';
import 'package:mvvm_architecture_flutter/res/app_url.dart';

class HomeRepo {
  final BaseApiService _apiService = NetworkApiService();

  Future<MovieModel> fetchMovieList() async {
    try {
      dynamic response =
          await _apiService.getGetApiResponse(AppUrl.movieListApiUrl);
      return response = MovieModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
