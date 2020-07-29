part of 'model.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final double voteAverage;
  final String overview;
  final String posterImage;
  final String backdropImage;

  Movie(
      {@required this.id,
      @required this.title,
      @required this.voteAverage,
      @required this.overview,
      @required this.posterImage,
      @required this.backdropImage});

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
      id: json['id'],
      title: json['title'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      overview: json['overview'],
      posterImage: json['poster_path'],
      backdropImage: json['backdrop_path']);

  @override
  // TODO: implement props
  List<Object> get props =>
      [id, title, voteAverage, posterImage, backdropImage];
}
