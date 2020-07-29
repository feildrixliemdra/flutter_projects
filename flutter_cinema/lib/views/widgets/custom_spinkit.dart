part of 'widget.dart';

class CustomSpinkit extends StatelessWidget {
  final double size;
  final Color color;

  CustomSpinkit({this.size = 50, this.color = mainColor});

  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      size: size,
      color: color,
    );
  }
}
