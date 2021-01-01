part of 'services.dart';

class MovieServices {
  static Future<List<Movie>> getMovies(int page, {http.Client client}) async {
    String url =
        "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page";

    // If Client Is Null
    client ??= http.Client();

    // Getting The Response
    var response = await client.get(url);

    // Checking If Status Code Is != 200
    if (response.statusCode != 200) {
      return [];
    }
    // Decoding The Json Response
    var data = json.decode(response.body);

    // Getting list From Key 'result'
    List result = data['results'];

    // Returning Map Movie
    return result.map((e) => Movie.fromJson(e)).toList();
  }
}
