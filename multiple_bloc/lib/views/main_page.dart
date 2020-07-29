import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_bloc/bloc/color_bloc.dart';
import 'package:multiple_bloc/bloc/counter_bloc.dart';
import 'package:multiple_bloc/views/draft_page.dart';
import 'package:multiple_bloc/views/selection_page.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorBloc, ColorState>(
      builder: (context, color) => DraftPage(
        bgColor: color.color,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, counterValue) => Text(
                  counterValue.countValue.toString(),
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SelectionPage()));
                },
                child: Text(
                  'Click to Change',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: color.color,
                shape: StadiumBorder(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
