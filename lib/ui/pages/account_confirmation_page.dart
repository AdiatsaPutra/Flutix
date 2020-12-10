part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;

  AccountConfirmationPage(this.registrationData);

  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSignInUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context
            .bloc<PageBloc>()
            .add(GoToPreferencePage(widget.registrationData));
        return;
      },
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: ListView(
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 90, left: 20),
                    height: 56,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                              onTap: () {
                                context.bloc<PageBloc>().add(GoToPreferencePage(
                                    widget.registrationData));
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                              )),
                        ),
                        Center(
                            child: Text(
                          'Confirm\nNew Account',
                          style: blackTextStyle.copyWith(
                              fontSize: 23, fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        )),
                      ],
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image:
                                (widget.registrationData.profileImage == null)
                                    ? AssetImage('assets/man.png')
                                    : FileImage(
                                        widget.registrationData.profileImage),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Welcome, ',
                    style: blackTextStyle.copyWith(
                        fontSize: 24, fontWeight: FontWeight.w300),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 90.0),
                    child: Text(
                      '${widget.registrationData.name}',
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  (isSignInUp == true)
                      ? SpinKitChasingDots(
                          color: Colors.green,
                          size: 45,
                        )
                      : SizedBox(
                          width: 250,
                          height: 45,
                          child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'Create My Account',
                                style: whiteTextStyle.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w300),
                                textAlign: TextAlign.center,
                              ),
                              color: Colors.green,
                              onPressed: () async {
                                setState(() {
                                  isSignInUp == true;
                                });

                                imageFileToUpload ==
                                    widget.registrationData.profileImage;
                                SignInSignUpResult result =
                                    await AuthServices.signUp(
                                        widget.registrationData.email,
                                        widget.registrationData.password,
                                        widget.registrationData.name,
                                        widget.registrationData.selectedGenres,
                                        widget.registrationData
                                            .selectedLanguages);
                                if (result.user == null) {
                                  setState(() {
                                    isSignInUp == false;
                                    Flushbar(
                                      backgroundColor: Colors.red,
                                      duration: Duration(seconds: 3),
                                      flushbarPosition: FlushbarPosition.BOTTOM,
                                      message: result.message,
                                    )..show(context);
                                  });
                                }
                              }))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
