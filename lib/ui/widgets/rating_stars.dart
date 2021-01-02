part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final double fontSize;

  const RatingStars(
      {this.voteAverage = 0, this.starSize = 20, this.fontSize = 12});
  @override
  Widget build(BuildContext context) {
    // Membulatkan Rating Stars
    int n = (voteAverage / 2).round();
    // Membulatkan Rating Ke Bawah Dibagi 2
    // int n = voteAverage ~/ 2;
    // Sama Seperti Ini, Dibuang Komanya
    // int n = (voteAverage / 2).truncate();
    // Membuat Bintang
    List<Widget> stars = List.generate(
      5,
      (index) => Icon(
        index < n ? MdiIcons.star : MdiIcons.starOutline,
        color: accentColor2,
        size: starSize,
      ),
    );
    stars.add(SizedBox(width: 3));
    stars.add(
      Text(
        '$voteAverage / 10',
        style: whiteNumberStyle.copyWith(
            fontWeight: FontWeight.w300, fontSize: fontSize),
      ),
    );
    return Row(
      children: stars,
    );
  }
}
