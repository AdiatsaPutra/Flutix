part of 'models.dart';

// Model Untuk Mengambil Preferensi Movie User Saat Sign Up
class RegistrationData {
  String name;
  String email;
  String password;
  List<String> selectedGenres;
  String selectedLanguages;
  File profileImage;
// Konstruktor Dengan Default Value
  RegistrationData(
      {this.name = "",
      this.email = "",
      this.password = "",
      this.profileImage,
      // selectedGenres merupakan array
      this.selectedGenres = const [],
      this.selectedLanguages = ""});
}
