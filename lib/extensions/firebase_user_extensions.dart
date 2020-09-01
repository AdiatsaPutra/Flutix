part of 'extensions.dart';

extension FirebaseUserExtensions on FirebaseUser {
  User convertToUser(
          {String name = "No Name",
          List<String> selectedGenres,
          String selectedLanguages = "English",
          int balance = 50000}) =>
      User(this.uid, this.email,
          name: name,
          balance: balance,
          selectedGenres: selectedGenres,
          selectedLanguages: selectedLanguages);

  Future<User> fromFireStore() async => await UserServices.getUser(this.uid);
}
