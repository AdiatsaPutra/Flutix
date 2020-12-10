part of 'pages.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan Data User Dari Firebase
    FirebaseUser firebaseUser = Provider.of<FirebaseUser>(context);
    // Kondisi User Sudah Login Atau Belum
    if (firebaseUser == null) {
      // Mencegah Firebase Mengirimkan Daata Dua Kali
      if (!(prevPageEvent is GoToSplashPage)) {
        prevPageEvent = GoToSplashPage();
        // Jika User Belum Login
        context.bloc<PageBloc>().add(prevPageEvent);
      }
    } else {
      if (!(prevPageEvent is GoToMainPage)) {
        // Load User Dulu
        context.bloc<UserBloc>().add(LoadUser(firebaseUser.uid));
        // Jika User Sudah Login
        prevPageEvent = GoToMainPage();
        context.bloc<PageBloc>().add(GoToMainPage());
      }
    }

    return BlocBuilder<PageBloc, PageState>(
        // Kondisi Navigasi PageState Akan Masuk Ke Halaman Apa
        builder: (_, pageState) => (pageState is OnSplashPage)
            ? SplashPage()
            : (pageState is OnLoginPage)
                ? SignInPage()
                : (pageState is OnRegistrationPage)
                    ? SignUpPage(pageState.registrationData)
                    : (pageState is OnPreferencePage)
                        ? PreferencePage(pageState.registrationData)
                        : (pageState is OnAccountConfirmationPage)
                            ? AccountConfirmationPage(
                                pageState.registrationData)
                            : MainPage());
  }
}
