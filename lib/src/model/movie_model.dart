class MovieModel {
  final bool adult;
  final String? backdropPath;
  final Collection? belongsToCollection;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final int id;
  final String? imdbId;
  final List<String>? originCountry;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final List<ProductionCountry>? productionCountries;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguage>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool video;
  final double? voteAverage;
  final int? voteCount;

  MovieModel({
    required this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    required this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    required this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json['adult'] ?? false,
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'] != null
          ? Collection.fromJson(json['belongs_to_collection'])
          : null,
      budget: json['budget'],
      genres: json['genres'] != null
          ? (json['genres'] as List).map((g) => Genre.fromJson(g)).toList()
          : null,
      homepage: json['homepage'],
      id: json['id'] ?? 0,
      imdbId: json['imdb_id'] ?? "",
      originCountry: json['origin_country'] != null
          ? List<String>.from(json['origin_country'])
          : null,
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity']?.toDouble(),
      posterPath: json['poster_path'],
      productionCompanies: json['production_companies'] != null
          ? (json['production_companies'] as List)
              .map((p) => ProductionCompany.fromJson(p))
              .toList()
          : null,
      productionCountries: json['production_countries'] != null
          ? (json['production_countries'] as List)
              .map((p) => ProductionCountry.fromJson(p))
              .toList()
          : null,
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: json['spoken_languages'] != null
          ? (json['spoken_languages'] as List)
              .map((s) => SpokenLanguage.fromJson(s))
              .toList()
          : null,
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'] ?? false,
      voteAverage: json['vote_average']?.toDouble(),
      voteCount: json['vote_count'],
    );
  }
}

class Collection {
  final int id;
  final String name;
  final String? posterPath;
  final String? backdropPath;

  Collection({
    required this.id,
    required this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json['id'],
      name: json['name'],
    );
  }
}

class ProductionCompany {
  final int id;
  final String? logoPath;
  final String name;
  final String originCountry;

  ProductionCompany({
    required this.id,
    this.logoPath,
    required this.name,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json['id'],
      logoPath: json['logo_path'],
      name: json['name'],
      originCountry: json['origin_country'],
    );
  }
}

class ProductionCountry {
  final String iso;
  final String name;

  ProductionCountry({required this.iso, required this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso: json['iso_3166_1'],
      name: json['name'],
    );
  }
}

class SpokenLanguage {
  final String englishName;
  final String iso;
  final String name;

  SpokenLanguage({required this.englishName, required this.iso, required this.name});

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      englishName: json['english_name'],
      iso: json['iso_639_1'],
      name: json['name'],
    );
  }
}
