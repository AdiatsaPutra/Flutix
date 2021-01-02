part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genres;

  BrowseButton({this.genres});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 4),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Color(0xFFEEF1F8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: SizedBox(
              height: 36,
              child: buildGenresIcon(genres),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          genres,
          style: blackTextStyle.copyWith(fontSize: 13),
        )
      ],
    );
  }
}

// Create Search Movie Based On Selected Genres
Widget buildGenresIcon(String genre) {
  switch (genre) {
    case 'Horror':
      return Icon(
        MdiIcons.ghost,
        size: 50,
        color: mainColor,
      );
      break;
    case 'Music':
      return Icon(
        MdiIcons.music,
        size: 50,
        color: mainColor,
      );
      break;
    case 'Action':
      return Icon(
        MdiIcons.naturePeople,
        size: 50,
        color: mainColor,
      );
      break;
    case 'Drama':
      return Icon(
        MdiIcons.hand,
        size: 50,
        color: mainColor,
      );
      break;
    case 'Crime':
      return Icon(
        MdiIcons.pen,
        size: 50,
        color: mainColor,
      );
      break;
    default:
      return null;
  }
}
