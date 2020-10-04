part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  // List Of Genres
  final List<String> genres = ['Horror', 'Music', 'Action', 'Drama', 'Crime'];

  // List Of Languages
  final List<String> languages = ['Indonesia', 'English', 'Japanese', 'Korean'];

  // Get Registration Data Instance
  final RegistrationData registrationData;

  PreferencePage(this.registrationData);
  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  // Variabel Untuk Menyimpan Pilihan Genres
  List<String> selectedGenres = [];

  // Variabel Untuk Menyimpan Pilihan Bahasa
  String selectedLanguages = 'English';

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
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 56,
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 4,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        // Empty Password Old Data
                        widget.registrationData.password = "";

                        context
                            .bloc<PageBloc>()
                            // Passing The registration Data Back (History)
                            .add(GoToRegistrationPage(widget.registrationData));
                      },
                      child: Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  Text('Choose Your Favorites',
                      style: blackTextStyle.copyWith(fontSize: 20)),
                  SizedBox(
                    height: 16,
                  ),
                  Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: generateGenres(context)
                      // Generate Widgets Genres
                      // generateGenres(context)
                      )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> generateGenres(BuildContext context) {
    // Calculating Container Width
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget.genres
        .map((genreElement) => SelectableBox(
              genreElement,
              width: width,
              isSelected: selectedGenres.contains(genreElement),
              onTap: () {
                onSelected(genreElement);
              },
            ))
        .toList();
  }

// Method OnSelected Pada Selectable Box Genres
  void onSelected(String genre) {
// Check Jika Sudah Ada Genre
    if (selectedGenres.contains(genre)) {
      setState(() {
        selectedGenres.remove(genre);
      });
    } else {
      // Check Jika Pilihan User Kurang Dari 4 Genre
      if (selectedGenres.length < 4) {
        setState(() {
          selectedGenres.add(genre);
        });
      }
    }
  }
}
