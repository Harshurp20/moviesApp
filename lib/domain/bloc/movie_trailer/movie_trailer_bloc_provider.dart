import 'package:flutter/material.dart';
import 'movie_trailer_bloc.dart';
import 'movie_trailer_state.dart';

// Link:- https://medium.com/flutterpub/architect-your-flutter-project-using-bloc-pattern-part-2-d8dd1eca9ba5
class MovieTrailerBlocProvider extends InheritedWidget {
  final MovieTrailerBloc movieTrailerBloc;

  MovieTrailerBlocProvider({Key? key, required Widget child})
      : movieTrailerBloc = MovieTrailerBloc(MovieTrailerState()),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MovieTrailerBloc of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MovieTrailerBlocProvider>()!
        .movieTrailerBloc;
  }
}
