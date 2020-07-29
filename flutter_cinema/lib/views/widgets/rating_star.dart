part of 'widget.dart';

class RatingStar extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final double fontSize;
  final TextStyle textStyle;
  RatingStar(
      {this.voteAverage = 0,
      this.starSize = 20,
      this.fontSize = 12,
      this.textStyle});

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();
    List<Widget> widgets = List.generate(
        5,
        (index) => Icon(
              index < n ? MdiIcons.star : MdiIcons.starOutline,
              color: accentColor1,
            ));

    widgets.add(SizedBox(
      width: 3,
    ));
    widgets.add(Text('$voteAverage/10', style: this.textStyle));
    return Row(
      children: widgets,
    );
  }
}
