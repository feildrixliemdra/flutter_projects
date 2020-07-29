part of 'widget.dart';

class PromoCard extends StatelessWidget {
  final Promo promo;

  PromoCard({this.promo});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 80,
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    promo.title,
                    style: whiteTextStyle.copyWith(
                        fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    promo.subtitle,
                    style: promoSubtitleTextStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
              Row(children: <Widget>[
                Text(
                  'OFF ',
                  style: yellowTextStyle.copyWith(fontSize: 18),
                ),
                Text(
                  '${promo.discount}%',
                  style: yellowTextStyle.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold),
                )
              ])
            ],
          ),
        ),
        //NOTE: LEFT REFLECTION
        ShaderMask(
          shaderCallback: (rectangle) {
            return LinearGradient(
                    colors: [Colors.black.withOpacity(0.1), Colors.transparent])
                .createShader(Rect.fromLTRB(0, 0, 77.5, 80));
          },
          blendMode: BlendMode.dstIn,
          child: SizedBox(
            height: 80,
            width: 77.5,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Image.asset('assets/reflection2.png')),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (rectangle) {
              return LinearGradient(colors: [
                Colors.black.withOpacity(0.1),
                Colors.transparent
              ]).createShader(Rect.fromLTRB(0, 0, 96, 45));
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 45,
              width: 96,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Image.asset('assets/reflection1.png')),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: ShaderMask(
            shaderCallback: (rectangle) {
              return LinearGradient(colors: [
                Colors.black.withOpacity(0.1),
                Colors.transparent
              ]).createShader(Rect.fromLTRB(0, 0, 54, 45));
            },
            blendMode: BlendMode.dstIn,
            child: SizedBox(
              height: 25,
              width: 54,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  child: Image.asset('assets/reflection3.png')),
            ),
          ),
        )
      ],
    );
  }
}
