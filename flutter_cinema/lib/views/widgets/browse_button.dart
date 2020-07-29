part of 'widget.dart';

class BrowseButton extends StatelessWidget {
  final String genre;

  BrowseButton({this.genre});
  Map _iconMap = {
    'war': 'ic_war.png',
    'music': 'ic_music.png',
    'drama': 'ic_drama.png',
    'horror': 'ic_horror.png',
    'crime': 'ic_crime.png',
    'action': 'ic_action.png',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(7),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Color(0xFFEBEFF6)),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image:
                        AssetImage('assets/${_iconMap[genre.toLowerCase()]}'))),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 4),
          child: Text(
            genre,
            textAlign: TextAlign.center,
            style: blackTextStyle.copyWith(
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
