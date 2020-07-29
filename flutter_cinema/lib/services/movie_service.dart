part of 'service.dart';

class MovieService {
  static Future<List<Movie>> getMovies(int page, {http.Client client}) async {
    String url =
        'https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page';
    client ??= http.Client();

    var response = await client.get(url);
    if (response.statusCode != 200) {
      return [];
    }
    var data = json.decode(response.body);
    List result = data['results'];
    return result.map((e) => Movie.fromJson(e)).toList();
  }

  static Future<MovieDetail> getMovieDetail(int id,
      {http.Client client}) async {
    String url =
        'https://api.themoviedb.org/3/movie/${id}?api_key=$apiKey&language=en-US';
    client ??= http.Client();
    var response = await client.get(url);
    if (response.statusCode != 200) {
      return MovieDetail();
    }

    var data = json.decode(response.body);
    List<Crew> crewData = await getCastCrew(id);

    return MovieDetail(
        backdropImage: data['backdrop_path'],
        title: data['title'],
        language: data['spoken_languages'][0]['name'],
        id: data['id'],
        overview: data['overview'],
        voteAverage: data['vote_average'],
        crews: crewData,
        genre: data['genres'][0]['name']);
  }

  static Future<List<Crew>> getCastCrew(int id, {http.Client client}) async {
    String url =
        'https://api.themoviedb.org/3/movie/$id/credits?api_key=$apiKey';
    List<Crew> results = [];

    client ??= http.Client();
    var response = await client.get(url);
    if (response.statusCode != 200) {
      return [];
    }

    var data = await json.decode(response.body);
    List cast = data['cast'];
//    cast.map((e) => results.add(Crew.fromJson(e)));

//    List crew = data['crew'];
//    crew.map((e) => results.add(Crew.fromJson(e)));

    return cast.map((e) => Crew.fromJson(e)).toList();
  }
}
