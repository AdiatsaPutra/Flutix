part of 'models.dart';

class User extends Equatable {
  // Variabel
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final List<String> selectedGenres;
  final String selectedLanguages;
  final int balance;
// Konstruktor
  User(this.id, this.email,
      {this.name,
      this.profilePicture,
      this.selectedGenres,
      this.selectedLanguages,
      this.balance});

  @override
  String toString() {
    return "[$id] - $name, $email";
  }

// Override Props
  @override
  List<Object> get props => [
        id,
        email,
        name,
        profilePicture,
        selectedGenres,
        selectedLanguages,
        balance
      ];
}
