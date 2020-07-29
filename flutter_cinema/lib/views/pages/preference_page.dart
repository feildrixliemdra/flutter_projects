part of 'page.dart';

class PreferencePage extends StatefulWidget {
  final List<String> _genres = [
    'Horor',
    'Music',
    'Action',
    'Drama',
    'War',
    'Crime'
  ];
  final List<String> _languages = ['Bahasa', 'English', 'Japanese', 'Korean'];

  final RegistrationData registrationData;
  PreferencePage(this.registrationData);

  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> _selectedGenres = [];
  String _selectedLanguage = 'English';
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          widget.registrationData.password = '';

          context.bloc<PageBloc>().add(GoToSignUpPage(widget.registrationData));
          return;
        },
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 20, bottom: 4),
                      height: 56,
                      child: GestureDetector(
                        onTap: () {
                          context
                              .bloc<PageBloc>()
                              .add(GoToSignUpPage(widget.registrationData));
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Select Your\nFavorite Genre',
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: generateGenreWidget(context),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Movie Language\nYou Prefer?',
                        style: blackTextStyle.copyWith(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: generateLanguageWidget(context),
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(top: 30),
                      child: FloatingActionButton(
                        child: Icon(Icons.arrow_forward),
                        backgroundColor: !(_selectedGenres.length == 0)
                            ? mainColor
                            : accentColor2,
                        elevation: 0,
                        onPressed: () {
                          if (_selectedGenres.length == 0) {
                            Flushbar(
                              flushbarPosition: FlushbarPosition.TOP,
                              message: 'Please select at least 1 genre',
                              backgroundColor: accentColor5,
                              duration: Duration(milliseconds: 1500),
                            ).show(context);
                          } else {
                            widget.registrationData.genres = _selectedGenres;
                            widget.registrationData.language =
                                _selectedLanguage;
                            context.bloc<PageBloc>().add(
                                GoToAccountConfirmationPage(
                                    widget.registrationData));
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }

  List<Widget> generateGenreWidget(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget._genres
        .map((e) => SelectableBox(
              '',
              text: e,
              width: width,
              isSelected: _selectedGenres.contains(e),
              onTap: () {
                onSelectGenre(e);
              },
            ))
        .toList();
  }

  void onSelectGenre(String genre) {
    if (_selectedGenres.contains(genre)) {
      setState(() {
        _selectedGenres.remove(genre);
      });
    } else {
      if (_selectedGenres.length < 4) {
        setState(() {
          _selectedGenres.add(genre);
        });
      }
    }
  }

  List<Widget> generateLanguageWidget(BuildContext context) {
    double width =
        (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget._languages
        .map((e) => SelectableBox(
              '',
              text: e,
              width: width,
              isSelected: _selectedLanguage == e,
              onTap: () {
                onSelectedLanguage(e);
              },
            ))
        .toList();
  }

  void onSelectedLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }
}
