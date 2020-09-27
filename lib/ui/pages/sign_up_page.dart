part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  // Mengambil Instance RegistrationData dari model RegistrationData
  RegistrationData registrationData;
// Konstruktor RegistrationData
  SignUpPage(this.registrationData);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // TextEditingControllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  @override
  void initState() {
    super.initState();
// Set Default Value
    nameController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                height: 56,
                child: Stack(
                  children: [
                    GestureDetector(
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToSplashPage());
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
