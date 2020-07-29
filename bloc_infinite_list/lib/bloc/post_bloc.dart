import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_infinite_list/models/model.dart';
import 'package:equatable/equatable.dart';

part 'post_event.dart';
part 'post_state.dart';
part 'simple_bloc_delegate.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostInitial();

  @override
  Stream<PostState> mapEventToState(
    PostEvent event,
  ) async* {
    final currentState = state;

    if (event is PostFetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostInitial) {
          final posts = await Post.getPostFromAPI(0, 20);
          yield PostSuccess(posts: posts, reachMax: false);
          return;
        }

        if (currentState is PostSuccess) {
          PostSuccess postLoaded = state as PostSuccess;
          final posts =
              await Post.getPostFromAPI(currentState.posts.length, 20);
          yield (posts.isEmpty)
              ? postLoaded.copyWith(reachMax: true)
              : PostSuccess(posts: currentState.posts + posts, reachMax: false);
        }
      } catch (_) {
        yield PostFailure();
      }
    }
  }

  bool _hasReachedMax(PostState state) =>
      state is PostSuccess && state.reachMax;
}
