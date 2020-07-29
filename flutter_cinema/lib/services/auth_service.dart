part of 'service.dart';

class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> genres, String language) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      User user = result.user
          .convertToUser(language: language, genres: genres, name: name);

      await UserServices.updateUser(user);
      return SignInSignUpResult(message: 'Success', user: user);
    } catch (e) {
      return SignInSignUpResult(
          message: e.toString().split(',')[1], user: null);
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = await result.user.fromFireStore();

      return SignInSignUpResult(user: user, message: 'Success');
    } catch (e) {
      return SignInSignUpResult(
          user: null, message: e.toString().split(',')[1].trim());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Stream<FirebaseUser> get userStream => _auth.onAuthStateChanged;
}

class SignInSignUpResult {
  final User user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}
