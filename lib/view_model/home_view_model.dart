import 'package:flutter/cupertino.dart';
import 'package:mvvm_architecture_flutter/data/response/api_reponse.dart';
import 'package:mvvm_architecture_flutter/model/movie_model.dart';
import 'package:mvvm_architecture_flutter/repository/home_repo.dart';

class HomeViewModel with ChangeNotifier {
  final _myRepo = HomeRepo();

  ApiResponse<MovieModel> moviesList = ApiResponse.loading();

  setMoviesList(ApiResponse<MovieModel> response) {
    moviesList = response;
    notifyListeners();
  }

  Future<void> fetchMoviesListApi() async {
    setMoviesList(ApiResponse.loading());
    _myRepo.fetchMovieList().then((value) {
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMoviesList(ApiResponse.error(error.toString()));
    });
  }
}
