part of 'extension.dart';

extension FirebaseUserExtension on FirebaseUser {
  User convertToUser(
          {String name = "No Name",
          List<String> genres = const [],
          String language = "English",
          int balance = 50000}) =>
      User(this.uid, this.email,
          name: name, balance: balance, genres: genres, language: language);

  Future<User> fromFireStore() async => await UserServices.getUser(this.uid);
}
