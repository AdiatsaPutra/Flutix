part of 'page_bloc.dart';

abstract class PageEvent extends Equatable {
  const PageEvent();
}

class GoToSplashPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToLoginPage extends PageEvent {
  @override
  List<Object> get props => [];
}

class GoToMainPage extends PageEvent {
  @override
  List<Object> get props => [];
}

// Register Page
class GoToRegistrationPage extends PageEvent {
  // Mengambil Instance Data Registrasi User
  final RegistrationData registrationData;

  GoToRegistrationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

// Preference Page
class GoToPreferencePage extends PageEvent {
  // Mengambil Instance Data Registrasi User
  final RegistrationData registrationData;

  GoToPreferencePage(this.registrationData);
  @override
  List<Object> get props => [];
}

// Account Confirmation Page
class GoToAccountConfirmationPage extends PageEvent {
  // Mengambil Instance Data Registrasi User
  final RegistrationData registrationData;

  GoToAccountConfirmationPage(this.registrationData);
  @override
  List<Object> get props => [];
}
