part of 'model.dart';

class MovieDetail extends Equatable {
  final int id;
  final String title;
  final String language;
  final String genre;
  final double voteAverage;
  final String overview;
  final String backdropImage;
  final List<Crew> crews;

  MovieDetail(
      {this.id,
      this.title,
      this.language,
      this.voteAverage,
      this.overview,
      this.backdropImage,
      this.crews,
      this.genre});

  @override
  // TODO: implement props
  List<Object> get props =>
      [id, title, language, voteAverage, overview, backdropImage, crews];
}
