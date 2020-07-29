import 'package:flutter/material.dart';

class DraftPage extends StatelessWidget {
  final Color bgColor;
  final Widget body;
  DraftPage({this.bgColor = Colors.teal, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiBLoC Multi Page Demo'),
        backgroundColor: bgColor,
      ),
      body: body,
    );
  }
}
