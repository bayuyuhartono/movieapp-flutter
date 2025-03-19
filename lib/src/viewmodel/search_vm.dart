import 'package:flutter/material.dart';
import 'package:movie_addict/src/data/response/api_response.dart';
import 'package:movie_addict/src/model/popular_model.dart';
import 'package:movie_addict/src/repository/tmdb_repository.dart';
import 'package:movie_addict/src/utils/debouncer.dart';
import 'package:movie_addict/src/view/detail_screen.dart';

class SearchVM extends ChangeNotifier {

  final _repo = TmdbRepo();
  final Debouncer _debouncer = Debouncer(milliseconds: 500);

  ApiResponse<PopularModel> searchData = ApiResponse.standby();

  void onSearch(String searchText) {
    _debouncer.run(() {
      if (searchText.length > 3) {
        fetchSearchData(searchText, 1);
      } else {
        _setSearchDataMain(ApiResponse.standby());
      }
    });
  }

  void onMovieTap(context,String movieId) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(movieId: movieId),
      ),
    );
  }

  void _setSearchDataMain(ApiResponse<PopularModel> response) {
    searchData = response;
    notifyListeners();
  }

  Future<void> fetchSearchData(String searchText, int page) async {
    _setSearchDataMain(ApiResponse.loading());
    _repo
        .getBySearchData(searchText, page)
        .then((value) => _setSearchDataMain(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setSearchDataMain(ApiResponse.error(error.toString())));
  }
}