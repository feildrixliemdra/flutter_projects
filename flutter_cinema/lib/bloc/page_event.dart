part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToSignUpPage extends PageEvent {
  final RegistrationData registrationData;

  GoToSignUpPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToAccountConfirmationPage extends PageEvent {
  final RegistrationData registrationData;

  GoToAccountConfirmationPage(this.registrationData);

  @override
  List<Object> get props => [];
}

class GoToPreferencePage extends PageEvent {
  final RegistrationData registrationData;

  GoToPreferencePage(this.registrationData);
  @override
  List<Object> get props => [];
}

class GoToMovieDetailPage extends PageEvent {
  final int movieID;

  GoToMovieDetailPage(this.movieID);
  @override
  List<Object> get props => [movieID];
}

class GoToSelectSchedulePage extends PageEvent {
  final MovieDetail movieDetail;

  GoToSelectSchedulePage(this.movieDetail);

  @override
  List<Object> get props => [movieDetail];
}
