
import 'package:intl/intl.dart';
import 'package:movie_addict/src/data/network/base_api_service.dart';
import 'package:movie_addict/src/data/network/network_api_service.dart';
import 'package:movie_addict/src/model/movie_model.dart';
import 'package:movie_addict/src/model/popular_model.dart';

class TmdbRepo {

  final BaseApiService _apiService = NetworkApiService();

  Future<PopularModel?> getNowplayingData() async {
    String uri = "movie/now_playing";
    try {
      dynamic response = await _apiService.getResponse(uri);
      final jsonData = PopularModel.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }

  Future<PopularModel?> getPopularData() async {
    String uri = "movie/popular";
    try {
      dynamic response = await _apiService.getResponse(uri);
      final jsonData = PopularModel.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }

  Future<PopularModel?> getByGenreData(String genre) async {
    final dateNow = DateFormat('yyyy-MM-dd');
    String uri = "discover/movie?with_genres=$genre&primary_release_date.lte=$dateNow";
    try {
      dynamic response = await _apiService.getResponse(uri);
      final jsonData = PopularModel.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }

  Future<PopularModel?> getBySearchData(String searchText, int page) async {
    String uri = "search/movie?query=$searchText&page=$page";
    try {
      dynamic response = await _apiService.getResponse(uri);
      final jsonData = PopularModel.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }

  Future<MovieModel?> getMovieDetailData(String movieId) async {
    try {
      String uri = "movie/$movieId";
      dynamic response = await _apiService.getResponse(uri);
      final jsonData = MovieModel.fromJson(response);
      return jsonData;
    } catch (e) {
      rethrow;
    }
  }

}