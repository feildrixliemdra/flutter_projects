part of 'widget.dart';

class CastCrewCard extends StatelessWidget {
  final String name, profile_image;

  CastCrewCard({this.name, this.profile_image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 70,
            height: 80,
            margin: EdgeInsets.only(bottom: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    image: !(profile_image == null)
                        ? NetworkImage(imageBaseURL + 'w185' + profile_image)
                        : AssetImage('assets/user_pic.png'),
                    fit: BoxFit.cover)),
          ),
          Text(
            name.replaceAll(' ', '\n'),
            softWrap: true,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: blackTextStyle.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}
