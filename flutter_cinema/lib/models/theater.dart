part of 'model.dart';

class Theater extends Equatable {
  final String name;

  Theater(this.name);

  @override
  // TODO: implement props
  List<Object> get props => [name];
}

List<Theater> dummyTheater = [
  Theater("CGV Central Park"),
  Theater("XXI Taman Anggrek"),
  Theater("CGV Slipi Jaya"),
  Theater("XXI Plaza Indonesia"),
  Theater("XXI Senayan City"),
];
