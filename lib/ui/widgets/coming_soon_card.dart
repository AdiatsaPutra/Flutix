part of 'widgets.dart';

class ComingSoonCard extends StatelessWidget {
  final Movie movie;
  final Function onTap;

  const ComingSoonCard(this.movie, {this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: NetworkImage(imgBaseURL + "w780" + movie.backdropPath),
            fit: BoxFit.cover),
      ),
    );
  }
}
