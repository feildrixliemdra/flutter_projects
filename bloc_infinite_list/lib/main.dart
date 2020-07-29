import 'package:bloc_infinite_list/bloc/post_bloc.dart';
import 'package:bloc_infinite_list/views/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<PostBloc>(
        create: (context) => PostBloc()..add(PostFetch()),
        child: MainPage(),
      ),
    );
  }
}
