part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;

  bool isPasswordValid = false;

  bool isSignInIn = false;

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));
    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());

        return;
      },
      child: Scaffold(
          body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                SizedBox(
                  height: 70,
                  child: Image.asset('assets/movie-ticket.png'),
                ),
                Container(
                  margin: EdgeInsets.only(top: 70, bottom: 40),
                  child: Text(
                    'Welcome Back!',
                    style: blackTextStyle.copyWith(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                TextField(
                  controller: emailController,
                  onChanged: (text) {
                    // Validasi Email Dengan Email Validator
                    setState(() {
                      isEmailValid = EmailValidator.validate(text);
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Email',
                      hintText: 'Email'),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: passwordController,
                  onChanged: (text) {
                    setState(() {
                      isPasswordValid = text.length >= 6;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Password',
                      hintText: 'Password'),
                ),
                SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      'Lupa Password? ',
                      style: greyTextStyle.copyWith(
                          fontSize: 12, fontWeight: FontWeight.w300),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Klik Di Sini',
                      style: purpleTextStyle.copyWith(fontSize: 12),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(top: 40, bottom: 30),
                  child: isSignInIn
                      ? SpinKitFadingCircle(
                          color: mainColor,
                        )
                      : FloatingActionButton(
                          elevation: 0,
                          backgroundColor: isEmailValid && isPasswordValid
                              ? mainColor
                              : Colors.grey,
                          onPressed: isEmailValid && isPasswordValid
                              ? () async {
                                  setState(() {
                                    isSignInIn = true;
                                  });

                                  SignInSignUpResult result =
                                      await AuthServices.signIn(
                                          emailController.text,
                                          passwordController.text);

                                  if (result.user == null) {
                                    setState(() {
                                      isSignInIn = false;
                                    });
                                    Flushbar(
                                      duration: Duration(seconds: 4),
                                      flushbarPosition: FlushbarPosition.TOP,
                                      backgroundColor: Color(0xFFFF5C83),
                                      message: result.message,
                                    )..show(context);
                                    // AlertDialog(
                                    //   title: Text('Terjadi Kesalahan'),
                                    //   content: Text(result.message),
                                    // );
                                  }
                                }
                              : null,
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                ),
                Row(
                  children: [
                    Text(
                      'Start Fresh Now? ',
                      style:
                          greyTextStyle.copyWith(fontWeight: FontWeight.w300),
                    ),
                    Text(
                      'Sign Up',
                      style: purpleTextStyle,
                    )
                  ],
                )
              ],
            )
          ]),
        ),
      )),
    );
  }
}
