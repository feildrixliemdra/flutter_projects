part of 'page.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Container(
            width: 130,
            height: 136,
            margin:
                EdgeInsets.only(left: 115, right: 115, top: 124, bottom: 70),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/logo.png'))),
          ),
          Text(
            'New Experience',
            style: blackTextStyle.copyWith(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 16,
          ),
          Text(
            'Watch a new movie\nmuch easier than any before',
            style: greyTextStyle.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          MaterialButton(
            onPressed: () {
              context.bloc<PageBloc>().add(GoToSignUpPage(RegistrationData()));
            },
            child: Container(
              margin: EdgeInsets.only(
                bottom: 19,
                top: 70,
              ),
              width: 250,
              height: 46,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), color: mainColor),
              child: Center(
                child: Text(
                  'Get Started',
                  style: whiteTextStyle.copyWith(fontSize: 16),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Already have an account?',
                style: greyTextStyle.copyWith(fontSize: 14),
              ),
              GestureDetector(
                child: Text(' Sign In',
                    style: purpleTextStyle.copyWith(fontSize: 14)),
                onTap: () {
                  context.bloc<PageBloc>().add(GoToLoginPage());
                },
              )
            ],
          )
        ]),
      ),
    );
  }
}
