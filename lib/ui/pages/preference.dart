part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final RegistrationData registrationData;

  const PreferencePage(this.registrationData);
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // If The User Hit The Back Button
      onWillPop: () async {
        // Empty Password When User Back To Sign Up Page
        widget.registrationData.password = "";

        context
            .bloc<PageBloc>()
            // Passing The registration Data Back (History)
            .add(GoToRegistrationPage(widget.registrationData));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
        ),
      ),
    );
  }
}
