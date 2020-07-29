import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Counter App'),
        ),
        body: Counter(),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _startNumber = 0;

  void _minus() {
    setState(() {
      _startNumber -= 1;
    });
  }

  void _plus() {
    setState(() {
      _startNumber += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_startNumber',
              style: TextStyle(fontSize: 40),
            ),
            Row(
              children: <Widget>[
                Container(
                  child: IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: _minus,
                  ),
                  margin: EdgeInsets.all(10),
                ),
                Container(
                  child: IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _plus,
                  ),
                  margin: EdgeInsets.all(10),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            )
          ],
        ),
      ),
    );
  }
}
