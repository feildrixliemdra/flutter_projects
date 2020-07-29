part of 'model.dart';

class RegistrationData {
  String name;
  String email;
  String password;
  List<String> genres;
  String language;
  File profilePicture;

  RegistrationData(
      {this.name = '',
      this.email = '',
      this.password = '123456',
      this.genres = const [],
      this.language = 'English',
      this.profilePicture});
}
