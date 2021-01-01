import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tiket_flutter/model/models.dart';
import 'package:tiket_flutter/services/services.dart';

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
      // Get Movie Data
      List<Movie> movies = await MovieServices.getMovies(1);
      yield MovieLoaded(movies: movies);
    }
  }
}
