part of 'page.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordlValid = false;
  bool isSignIn = false;

  @override
  Widget build(BuildContext context) {
    // print(isEmailValid);
    // print(isPasswordlValid);
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor1)));

    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 70),
                    child: SizedBox(
                      height: 70,
                      width: 67,
                      child: Image.asset('assets/logo.png'),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        bottom: 40,
                      ),
                      child: Text(
                        'Welcome Back,\nExplorer!',
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      )),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: "Email Address",
                        hintText: "Email Address",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onChanged: (text) {
                      setState(() {
                        isEmailValid = EmailValidator.validate(text);
                        print('email state ' + isEmailValid.toString());
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onChanged: (text) {
                      setState(() {
                        isPasswordlValid = text.length >= 6;
                        print('password state ' + isPasswordlValid.toString());
                      });
                    },
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Forgot Password?'),
                          Text(
                            ' Get Now',
                            style: purpleTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          )
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 40, bottom: 30),
                      width: 50,
                      height: 50,
                      child: isSignIn
                          ? SpinKitFadingCircle(
                              color: mainColor,
                            )
                          : FloatingActionButton(
                              elevation: 0,
                              onPressed: isEmailValid && isPasswordlValid
                                  ? () async {
                                      setState(() {
                                        isSignIn = true;
                                      });
                                      SignInSignUpResult result =
                                          await AuthService.signIn(
                                              emailController.text,
                                              passwordController.text);
                                      if (result.user == null) {
                                        setState(() {
                                          isSignIn = false;
                                        });
                                        Flushbar(
                                          duration: Duration(seconds: 4),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                          backgroundColor: accentColor5,
                                          message: result.message,
                                        ).show(context);
                                      }
                                    }
                                  : () {},
                              child: Icon(
                                Icons.arrow_forward,
                                color: isEmailValid && isPasswordlValid
                                    ? Colors.white
                                    : Color(0xFFBEBEBE),
                              ),
                              backgroundColor: isEmailValid && isPasswordlValid
                                  ? mainColor
                                  : accentColor2,
                            ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Start fresh now?'),
                      Text(' Sign Up',
                          style: purpleTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.normal))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
