part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 136,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/movie-ticket.png'))),
            ),
            Container(
              margin: EdgeInsets.only(top: 70, bottom: 16),
              child: Text(
                'Get Ticket Easily',
                style: blackTextStyle.copyWith(
                    fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
            Text(
              'Get Of Your Bed And Feel\nThe Wind Of Pandemic Cinema',
              style: greyTextStyle.copyWith(
                  fontSize: 16, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
            Container(
              width: 250,
              height: 46,
              margin: EdgeInsets.only(top: 100, bottom: 16),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: RaisedButton(
                  color: mainColor,
                  child: Text(
                    'Get Started',
                    style: whiteTextStyle.copyWith(fontSize: 16),
                  ),
                  onPressed: () {
                    context.bloc<PageBloc>().add(GoToLoginPage());
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have An Account? ',
                  style: greyTextStyle.copyWith(fontWeight: FontWeight.w300),
                ),
                InkWell(
                    onTap: () {
                      print('Tapped');
                    },
                    child: Text('Sign In', style: purpleTextStyle))
              ],
            )
          ],
        ),
      ),
    );
  }
}
