

import 'package:flutter/material.dart';
import 'package:movie_addict/src/data/response/api_response.dart';
import 'package:movie_addict/src/model/movie_model.dart';
import 'package:movie_addict/src/repository/tmdb_repository.dart';

class DetailVM extends ChangeNotifier {
  final String movieId;

  final _repo = TmdbRepo();

  ApiResponse<MovieModel> movieData = ApiResponse.loading();

  DetailVM(this.movieId) {
    fetchMovieData(movieId);
  }

  void _setMovieMain(ApiResponse<MovieModel> response) {
    movieData = response;
    notifyListeners();
  }

  Future<void> fetchMovieData(String id) async {
    _setMovieMain(ApiResponse.loading());
    _repo
        .getMovieDetailData(id)
        .then((value) => _setMovieMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setMovieMain(ApiResponse.error(error.toString())));
  }
}