part of 'model.dart';

class Promo extends Equatable {
  final String title;
  final String subtitle;
  final int discount;

  Promo({this.title, this.subtitle, this.discount});

  @override
  // TODO: implement props
  List<Object> get props => [title, subtitle, discount];
}

List<Promo> dummyPromos = [
  Promo(
      title: 'Student Holiday',
      subtitle: 'Maximal only for two people',
      discount: 50),
  Promo(
      title: 'Family Club',
      subtitle: 'Minimal for three members',
      discount: 70),
  Promo(
      title: 'Student Holiday',
      subtitle: 'Maximal only for two people',
      discount: 50),
];
