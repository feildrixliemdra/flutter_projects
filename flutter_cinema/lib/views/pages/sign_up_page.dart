part of 'page.dart';

class SignUpPage extends StatefulWidget {
  final RegistrationData registrationData;

  SignUpPage(this.registrationData);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmationPasswordController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = widget.registrationData.name;
    emailController.text = widget.registrationData.email;
  }

  @override
  Widget build(BuildContext context) {
    context
        .bloc<ThemeBloc>()
        .add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor3)));
    return WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToSplashPage());
          return;
        },
        child: Scaffold(
          body: Container(
            margin: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 22),
            color: Colors.white,
            child: ListView(
              children: <Widget>[
                Container(
                  width: 219,
                  height: 56,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {
                            context.bloc<PageBloc>().add(GoToSplashPage());
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Create Your\nNew Account',
                          style: blackTextStyle.copyWith(
                              fontSize: 20, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 90,
                  height: 104,
                  margin: EdgeInsets.only(top: 22, bottom: 35),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      (widget.registrationData.profilePicture ==
                                              null)
                                          ? AssetImage('assets/user_pic.png')
                                          : FileImage(widget.registrationData
                                              .profilePicture))),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: GestureDetector(
                          onTap: () async {
                            if (widget.registrationData.profilePicture ==
                                null) {
                              widget.registrationData.profilePicture =
                                  await getImageFromGallery();
                            } else {
                              widget.registrationData.profilePicture = null;
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: 28,
                            width: 28,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: (widget.registrationData
                                                .profilePicture ==
                                            null)
                                        ? AssetImage('assets/btn_add_photo.png')
                                        : AssetImage(
                                            'assets/btn_del_photo.png'))),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6)),
                          labelText: 'Full Name',
                          hintText: 'Full Name'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6)),
                          labelText: 'Email Address',
                          hintText: 'Email Address'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6)),
                          labelText: 'Password',
                          hintText: 'Password'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      controller: confirmationPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6)),
                          labelText: 'Confirm Password',
                          hintText: 'Confirm Password'),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Center(
                        child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: mainColor,
                      child: Icon(Icons.arrow_forward),
                      onPressed: () {
                        if (!(nameController.text.trim() != "" &&
                            emailController.text.trim() != "" &&
                            passwordController.text.trim() != "" &&
                            confirmationPasswordController.text.trim() != "")) {
                          Flushbar(
                            duration: Duration(seconds: 1),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: accentColor5,
                            message: "Please fill all fields.",
                          ).show(context);
                        } else if (passwordController.text !=
                            confirmationPasswordController.text) {
                          Flushbar(
                            duration: Duration(seconds: 1),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: accentColor5,
                            message:
                                "Missmatch password and confirmation password.",
                          ).show(context);
                        } else if (passwordController.text.length <= 6) {
                          Flushbar(
                            duration: Duration(seconds: 1),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: accentColor5,
                            message: "Minimum password length is 6.",
                          ).show(context);
                        } else if (!EmailValidator.validate(
                            emailController.text)) {
                          Flushbar(
                            duration: Duration(seconds: 1),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: accentColor5,
                            message: "Invalid email address.",
                          ).show(context);
                        } else {
                          widget.registrationData.name = nameController.text;
                          widget.registrationData.email = emailController.text;
                          widget.registrationData.password =
                              passwordController.text;

                          context
                              .bloc<PageBloc>()
                              .add(GoToPreferencePage(widget.registrationData));
                        }
                      },
                    ))
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
