import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fluttercinema/models/model.dart';
import 'package:fluttercinema/services/service.dart';
import 'package:fluttercinema/views/pages/page.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  @override
  MovieState get initialState => MovieInitial();

  @override
  Stream<MovieState> mapEventToState(
    MovieEvent event,
  ) async* {
    if (event is FetchMovie) {
      List<Movie> movies = await MovieService.getMovies(1);
      yield MovieLoaded(movies);
    } else if (event is FetchMovieDetail) {
      MovieDetail movie = await MovieService.getMovieDetail(event.id);
      yield MovieDetailLoaded(movie);
    }
  }
}
