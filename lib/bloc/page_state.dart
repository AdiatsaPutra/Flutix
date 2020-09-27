part of 'page_bloc.dart';

abstract class PageState extends Equatable {
  const PageState();
}

class OnInitialPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnLoginPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnSplashPage extends PageState {
  @override
  List<Object> get props => [];
}

class OnMainPage extends PageState {
  @override
  List<Object> get props => [];
}

// Register Page
class OnRegistrationPage extends PageState {
  // Mengambil Instance Data Registrasi User
  final RegistrationData registrationData;

  OnRegistrationPage(this.registrationData);
  @override
  List<Object> get props => [];
}

// Preference Page
class OnPreferencePage extends PageState {
  // Mengambil Instance Data Registrasi User
  final RegistrationData registrationData;

  OnPreferencePage(this.registrationData);
  @override
  List<Object> get props => [];
}

// Account Confirmation Page
class OnAccountConfirmationPage extends PageState {
  // Mengambil Instance Data Registrasi User
  final RegistrationData registrationData;

  OnAccountConfirmationPage(this.registrationData);
  @override
  List<Object> get props => [];
}
