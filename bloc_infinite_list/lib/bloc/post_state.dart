part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostFailure extends PostState {}

class PostSuccess extends PostState {
  final List<Post> posts;
  final bool reachMax;

  PostSuccess({this.posts, this.reachMax});

  PostSuccess copyWith({List<Post> posts, bool reachMax}) {
    return PostSuccess(
        posts: posts ?? this.posts, reachMax: reachMax ?? this.reachMax);
  }

  @override
  List<Object> get props => [posts, reachMax];

  @override
  String toString() =>
      'PostLoaded { posts: ${posts.length}, reachMax: $reachMax }';
}
