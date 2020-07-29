part of 'model.dart';

class Crew extends Equatable {
  final int id;
  final String name;
  final String profile_image;

  Crew({this.id, this.name, this.profile_image});

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        id: json['id'],
        name: json['name'],
        profile_image: json['profile_path'],
      );

  @override
  // TODO: implement props
  List<Object> get props => [name, profile_image];
}
