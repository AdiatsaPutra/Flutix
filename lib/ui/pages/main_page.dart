part of 'pages.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<UserBloc, UserState>(
                builder: (_, userState) => (userState is UserLoaded)
                    ? Center(
                        child: AlertDialog(
                          backgroundColor: Colors.purple,
                          actions: [
                            Text(userState.user.name),
                            Text(userState.user.email),
                            Text(userState.user.balance.toString())
                          ],
                        ),
                      )
                    : Text('No User Loaded !')),
            RaisedButton(
                child: Text('Sign Out'),
                onPressed: () {
                  AuthServices.signOut();
                }),
          ],
        ),
      ),
    );
  }
}
