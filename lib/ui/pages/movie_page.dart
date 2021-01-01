part of 'pages.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // note: APPBAR
        Container(
          decoration: BoxDecoration(
              color: accentColor1,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) {
              if (userState is UserLoaded) {
                if (imageFileToUpload != null) {
                  uploadImage(imageFileToUpload).then(
                    (downloadURL) {
                      imageFileToUpload = null;
                      context
                          .bloc<UserBloc>()
                          .add(UpdateData(profilImage: downloadURL));
                    },
                  );
                }
                return Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0xFF5F558B), width: 1)),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: (userState.user.profilePicture == ""
                                        ? AssetImage("assets/man.png")
                                        : NetworkImage(
                                            userState.user.profilePicture)),
                                    fit: BoxFit.cover)),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width -
                              defaultMargin * 2 -
                              78,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hi, ' + userState.user.name,
                                style: whiteTextStyle.copyWith(fontSize: 18),
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                              ),
                              GestureDetector(
                                child: Text(
                                  'Sign Out',
                                  style: whiteTextStyle,
                                ),
                                onTap: () {
                                  context.bloc<UserBloc>().add(SignOut());
                                  AuthServices.signOut();
                                },
                              )
                            ],
                          ),
                        ),
                        Row(children: [
                          Text('Sisa Saldo: ', style: whiteTextStyle),
                          Text(
                            NumberFormat.currency(
                                    symbol: 'Rp. ', locale: 'id_ID')
                                .format(userState.user.balance),
                            style: yellowNumberStyle.copyWith(fontSize: 14),
                          )
                        ])
                      ],
                    )
                  ],
                );
              } else {
                return SpinKitFadingCircle(
                  color: accentColor2,
                  size: 50,
                );
              }
            },
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 30, defaultMargin, 12),
          child: Text(
            'Now Playing',
            style: blackTextStyle.copyWith(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (_, movieState) {
              if (movieState is MovieLoaded) {
                // Get Movies From 1-10
                List<Movie> movies = movieState.movies.sublist(0, 10);
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: (_, index) => Container(
                          margin: EdgeInsets.all(5),
                          child: Text(movies[index].title),
                        ));
              } else {
                return SpinKitFadingCircle(
                  color: mainColor,
                  size: 50,
                );
              }
            },
          ),
        )
      ],
    );
  }
}
