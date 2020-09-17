part of 'services.dart';

class UserServices {
  // Membuat Collection Baru Dengan Nama 'users' Pada Firestore
  static CollectionReference _userCollection =
      Firestore.instance.collection('users');
  // Mengupdate Collection 'users'
  // Set Data User Baru Pada Firestore
  static Future<void> updateUser(User user) {
    _userCollection.document(user.id).setData({
      'email': user.email,
      'name': user.name,
      'balance': user.balance,
      'selectedGenres': user.selectedGenres,
      'selectedLanguages': user.selectedLanguages,
      'profilePicture': user.profilePicture ?? '',
    });
  }

// Mengambil Data User Dari Firestore Berdasarkan id Dan Menjadikannya Objek User
  static Future<User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.document(id).get();
    return User(
      id,
      snapshot.data['email'],
      name: snapshot.data['name'],
      balance: snapshot.data['balance'],
      profilePicture: snapshot.data['profilePictures'],
      selectedGenres: (snapshot.data['selectedGenre'] as List)
          .map((e) => e.toString())
          .toList(),
      selectedLanguages: snapshot.data['selectedLanguages'],
    );
  }
}
