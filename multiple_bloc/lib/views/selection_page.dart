import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiple_bloc/bloc/color_bloc.dart';
import 'package:multiple_bloc/bloc/counter_bloc.dart';
import 'package:multiple_bloc/views/draft_page.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);

    return BlocBuilder<ColorBloc, ColorState>(
      builder: (context, colorState) => DraftPage(
        bgColor: colorState.color,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<CounterBloc, CounterState>(
                builder: (context, count) => FlatButton(
                  onPressed: () {
                    counterBloc.add(Increment());
                  },
                  child: Text(
                    count.countValue.toString(),
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      colorBloc.add(ToRed());
                    },
                    color: Colors.red,
                    shape: CircleBorder(),
                  ),
                  RaisedButton(
                    onPressed: () {
                      colorBloc.add(ToTeal());
                    },
                    color: Colors.teal,
                    shape: CircleBorder(),
                  ),
                  RaisedButton(
                    onPressed: () {
                      colorBloc.add(ToYellow());
                    },
                    color: Colors.yellow,
                    shape: CircleBorder(),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
