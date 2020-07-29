import 'package:bloc_example/bloc/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
        child: MainPage(),
        create: (context) => ColorBloc(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Flutter BLoC')),
      body: Center(
        child: BlocBuilder<ColorBloc, ColorState>(
          builder: (context, colorState) => AnimatedContainer(
            duration: Duration(milliseconds: 500),
            width: 200,
            height: 200,
            color: colorState.color,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              onPressed: () {
                colorBloc.add(ToTeal());
              },
              backgroundColor: Colors.teal),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
              onPressed: () {
                colorBloc.add(ToRed());
              },
              backgroundColor: Colors.red),
        ],
      ),
    );
  }
}
