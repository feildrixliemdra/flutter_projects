part of 'page.dart';

class AccountConfirmationPage extends StatefulWidget {
  final RegistrationData registrationData;

  AccountConfirmationPage(this.registrationData);

  @override
  _AccountConfirmationPageState createState() =>
      _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool _isSignUp = false;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          context
              .bloc<PageBloc>()
              .add(GoToPreferencePage(widget.registrationData));
          return;
        },
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.only(
                top: 44, left: defaultMargin, right: defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                          onTap: () {
                            context.bloc<PageBloc>().add(
                                GoToPreferencePage(widget.registrationData));
                          },
                          child: Icon(Icons.arrow_back)),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Confirm\nNew Account',
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 90, bottom: 20),
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: widget.registrationData.profilePicture == null
                              ? AssetImage('assets/user_pic.png')
                              : FileImage(
                                  widget.registrationData.profilePicture))),
                ),
                Text(
                  'Welcome',
                  style: greyTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w300),
                ),
                Text(
                  widget.registrationData.name,
                  style: blackTextStyle.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: 110,
                ),
                (_isSignUp)
                    ? SpinKitCircle(
                        size: 45,
                        color: accentColor4,
                      )
                    : SizedBox(
                        width: 250,
                        height: 46,
                        child: RaisedButton(
                          onPressed: () async {
                            setState(() {
                              _isSignUp = true;
                              if (widget.registrationData.profilePicture !=
                                  null) {
                                profileImageToUpload =
                                    widget.registrationData.profilePicture;
                              }
                            });

                            SignInSignUpResult signUpResult =
                                await AuthService.signUp(
                                    widget.registrationData.email,
                                    widget.registrationData.password,
                                    widget.registrationData.name,
                                    widget.registrationData.genres,
                                    widget.registrationData.language);

                            if (signUpResult.user == null) {
                              setState(() {
                                _isSignUp = false;
                              });
                              Flushbar(
                                backgroundColor: accentColor5,
                                flushbarPosition: FlushbarPosition.TOP,
                                duration: Duration(milliseconds: 1500),
                                message: signUpResult.message,
                              ).show(context);
                            }
                          },
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          color: accentColor4,
                          child: Text(
                            'Create My Account',
                            style: whiteTextStyle.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
              ],
            ),
          ),
        ));
  }
}
