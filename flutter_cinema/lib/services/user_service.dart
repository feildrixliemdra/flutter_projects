part of 'service.dart';

class UserServices {
//  static CollectionReference
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');
  static Future<void> updateUser(User user) async {
    _userCollection.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'genres': user.genres,
      'language': user.language,
      'profilePicture': user.profilePicture ?? ''
    });
  }

  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.document(id).get();

    return User(id, snapshot.data['email'],
        balance: snapshot.data['balance'],
        profilePicture: snapshot.data['profilePicture'],
        name: snapshot.data['name'],
        genres:
            (snapshot.data['genres'] as List).map((e) => e.toString()).toList(),
        language: snapshot.data['language']);
  }
}
