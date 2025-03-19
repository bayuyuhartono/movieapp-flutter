

import 'package:flutter/material.dart';
import 'package:movie_addict/src/data/response/api_response.dart';
import 'package:movie_addict/src/model/popular_model.dart';
import 'package:movie_addict/src/repository/tmdb_repository.dart';
import 'package:movie_addict/src/view/detail_screen.dart';

class HomeVM extends ChangeNotifier {
  final _repo = TmdbRepo();

  ApiResponse<PopularModel> popularData = ApiResponse.loading();
  ApiResponse<PopularModel> nowplayingData = ApiResponse.loading();
  ApiResponse<PopularModel> actionData = ApiResponse.loading();
  ApiResponse<PopularModel> horrorData = ApiResponse.loading();

  HomeVM() {
    fetchPopularData();
    fetchNowplayingData();
    fetchActionData();
    fetchHorrorData();
  }

  void onMovieTap(context,String movieId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(movieId: movieId),
      ),
    );
  }

  void _setPopularMain(ApiResponse<PopularModel> response) {
    popularData = response;
    notifyListeners();
  }

  void _setNowplayingMain(ApiResponse<PopularModel> response) {
    nowplayingData = response;
    notifyListeners();
  }

  void _setHorrorMain(ApiResponse<PopularModel> response) {
    horrorData = response;
    notifyListeners();
  }

  void _setActionMain(ApiResponse<PopularModel> response) {
    actionData = response;
    notifyListeners();
  }

  Future<void> fetchPopularData() async {
    _setPopularMain(ApiResponse.loading());
    _repo
        .getPopularData()
        .then((value) => _setPopularMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setPopularMain(ApiResponse.error(error.toString())));
  }

  Future<void> fetchNowplayingData() async {
    _setNowplayingMain(ApiResponse.loading());
    _repo
        .getNowplayingData()
        .then((value) => _setNowplayingMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setNowplayingMain(ApiResponse.error(error.toString())));
  }

  Future<void> fetchActionData() async {
    _setActionMain(ApiResponse.loading());
    _repo
        .getByGenreData("28")
        .then((value) => _setActionMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setActionMain(ApiResponse.error(error.toString())));
  }

  Future<void> fetchHorrorData() async {
    _setHorrorMain(ApiResponse.loading());
    _repo
        .getByGenreData("27")
        .then((value) => _setHorrorMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setHorrorMain(ApiResponse.error(error.toString())));
  }
}