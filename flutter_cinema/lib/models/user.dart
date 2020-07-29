part of 'model.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final List<String> genres;
  final String profilePicture;
  final String language;
  final int balance;

  User(this.id, this.email,
      {this.name,
      this.genres,
      this.profilePicture,
      this.language,
      this.balance});

  User copyWith({String name, String profilePicture, int balance}) =>
      User(this.id, this.email,
          name: name ?? this.name,
          profilePicture: profilePicture ?? this.profilePicture,
          genres: genres,
          language: language,
          balance: balance ?? this.balance);
  @override
  List<Object> get props =>
      [id, email, name, genres, profilePicture, language, balance];

  @override
  String toString() {
    return '$id - $name -$email';
  }
}
