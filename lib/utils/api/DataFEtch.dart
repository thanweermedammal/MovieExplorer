import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:movie_explorer/models/movieLists_model.dart';
import 'package:movie_explorer/models/movie_detail_model.dart';
class DataFetch{
  Future<MovieSearchResponse?>movieList(pagenumber)async{
    try {
      final response = await http.get(
          Uri.parse("https://omdbapi.com/?apikey=c585efc2&i&s=avengers&page=$pagenumber"));
      if(response.statusCode==200){
        final jsonData = jsonDecode(response.body); // ✅ decode String -> Map
        final data = MovieSearchResponse.fromJson(jsonData);
        return data;
      }
      else {
        print("Request failed with status: ${response.statusCode}");
      }
    }catch(e){
      print("error$e");

    }
  return null;
}

  Future<MovieDetail?> movieDetails()async{
    try {
      final response = await http.get(
          Uri.parse("https://www.omdbapi.com/?apikey=YOUR_KEY&i=tt0848228&plot=full"));
      if(response.statusCode==200){
        final jsonData = jsonDecode(response.body); // ✅ decode String -> Map
        final data = MovieDetail.fromJson(jsonData);
        return data;
      }
      else {
        print("Request failed with status: ${response.statusCode}");
      }
    }catch(e){
      print("error$e");

    }
    return null;
  }

}