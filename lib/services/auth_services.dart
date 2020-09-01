part of 'services.dart';

class AuthServices {
// Inisialisasi Firebase Auth Instance
  static FirebaseAuth _auth = FirebaseAuth.instance;

// Method signUp
  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      // Memanggil Model User
      User user = result.user.convertToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguages: selectedLanguage);
      // Memanggil Method updateUser
      await UserServices.updateUser(user);

      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1]);
    }
  }

// Method signIn
  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      // Mengambil Data User Dari Firestore
      User user = await result.user.fromFireStore();
      return SignInSignUpResult(user: user);
    } catch (e) {
      return SignInSignUpResult(message: e.toString().split(',')[1]);
    }
  }

// Method signOut
  static Future<void> signOut() async {
    _auth.signOut();
  }

// Stream Untuk Memberi Tahu Aplikasi Jika Ada Perubahan Status Di Firebase Authentication
  static Stream<FirebaseUser> get userStream => _auth.onAuthStateChanged;
}

// Class Untuk Mengambil user Dan message Error Dari Firebase
class SignInSignUpResult {
  final User user;
  final String message;

  SignInSignUpResult({this.user, this.message});
}
