class MovieSearchResponse {
  final List<MovieItem> search;
  final String totalResults;
  final String response;

  MovieSearchResponse({
    required this.search,
    required this.totalResults,
    required this.response,
  });

  factory MovieSearchResponse.fromJson(Map<String, dynamic> json) {
    return MovieSearchResponse(
      search: (json['Search'] as List)
          .map((e) => MovieItem.fromJson(e))
          .toList(),
      totalResults: json['totalResults'] ?? "",
      response: json['Response'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Search': search.map((e) => e.toJson()).toList(),
      'totalResults': totalResults,
      'Response': response,
    };
  }
}

class MovieItem {
  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;

  MovieItem({
    required this.title,
    required this.year,
    required this.imdbID,
    required this.type,
    required this.poster,
  });

  factory MovieItem.fromJson(Map<String, dynamic> json) {
    return MovieItem(
      title: json['Title'] ?? "",
      year: json['Year'] ?? "",
      imdbID: json['imdbID'] ?? "",
      type: json['Type'] ?? "",
      poster: json['Poster'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Title': title,
      'Year': year,
      'imdbID': imdbID,
      'Type': type,
      'Poster': poster,
    };
  }
}
