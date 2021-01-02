part of 'models.dart';

class Promo extends Equatable {
  final String title;
  final String subtitle;
  final int discount;

  Promo(
      {@required this.title, @required this.subtitle, @required this.discount});
  @override
  List<Object> get props => [title, subtitle, discount];
}

// Dummy
List<Promo> dummyPromos = [
  Promo(
      title: 'fagafsafgsf',
      subtitle: 'gasfygasfagsfagsfghasfghafsghfsgfg',
      discount: 50),
  Promo(
      title: 'fagafsafgsf',
      subtitle: 'gasfygasfagsfagsfghasfghafsghfsgfg',
      discount: 50),
  Promo(
      title: 'fagafsafgsf',
      subtitle: 'gasfygasfagsfagsfghasfghafsghfsgfg',
      discount: 50),
];
