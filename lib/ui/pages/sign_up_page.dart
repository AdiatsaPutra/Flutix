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
    // Get Theme Data
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        body: Container(
          color: mainColor,
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                height: 56,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: () {
                            context.bloc<PageBloc>().add(GoToSplashPage());
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          )),
                    ),
                    Center(
                        child: Text(
                      'Sign Me Up',
                      style: whiteTextStyle.copyWith(
                          fontSize: 23, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    )),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 104,
                  width: 90,
                  child: Stack(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: (widget.registrationData.profileImage ==
                                        null)
                                    ? AssetImage('assets/man.png')
                                    : FileImage(
                                        widget.registrationData.profileImage))),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () async {
                            // Checking Image Availability
                            if (widget.registrationData.profileImage == null) {
                              widget.registrationData.profileImage =

                                  // Get Image From Gallery
                                  await pick();
                            } else {
                              // If Image Is Null
                              widget.registrationData.profileImage = null;
                            }

                            // Updating Profil Picture State
                            setState(() {});
                          },
                          child: Container(
                              height: 28,
                              width: 28,
                              child: (widget.registrationData.profileImage ==
                                      null)
                                  ? Icon(Icons.add_a_photo, color: Colors.white)
                                  : Icon(
                                      Icons.remove_circle,
                                      color: Colors.red,
                                    )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 36,
              ),
              Container(
                height: MediaQuery.of(context).size.height - 270,
                width: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      TextField(
                        controller: nameController,
                        maxLength: 20,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: 'Name',
                          labelText: 'Name',
                        ),
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Email',
                            labelText: 'Email'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: passwordController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Password',
                            labelText: 'Password'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextField(
                        controller: confirmController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'Confirm Password',
                            labelText: 'Confirm Password'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FloatingActionButton(
                          backgroundColor: mainColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: Container(
                              width: 70,
                              height: 50,
                              child: Icon(
                                Icons.navigate_next,
                                color: Colors.white,
                              )),
                          onPressed: () {})
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
