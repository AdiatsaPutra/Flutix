part of 'pages.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignInPage'),
      ),
      body: Center(
        child: RaisedButton(
            child: Text('Sign In'),
            onPressed: () {
              AuthServices.signIn('test@gmail.com', 'password');
            }),
      ),
    );
  }
}
