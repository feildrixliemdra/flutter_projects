part of 'page.dart';

class MovieDetailPage extends StatefulWidget {
  final int movieID;

  MovieDetailPage(this.movieID);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    context.bloc<MovieBloc>().add(FetchMovieDetail(widget.movieID));
    return WillPopScope(
        onWillPop: () {
          context.bloc<PageBloc>().add(GoToMainPage());
          context.bloc<MovieBloc>().add(FetchMovie());
          return;
        },
        child: Scaffold(
          body: Stack(children: <Widget>[
            Container(
              color: accentColor3,
            ),
            SafeArea(child: Container(color: Color(0xFFF6F7F9))),
            BlocBuilder<MovieBloc, MovieState>(
              builder: (_, movieState) {
                if (movieState is MovieDetailLoaded) {
                  MovieDetail movieDetail = movieState.movieDetail;
                  return ListView(children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Stack(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 270,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage('$imageBaseURL' +
                                          'w780' +
                                          '${movieDetail.backdropImage}'),
                                      fit: BoxFit.cover)),
                              child: Container(
                                width: double.infinity,
                                height: 271,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment(0, 1),
                                        end: Alignment(0, 0.06),
                                        colors: [
                                      Colors.white,
                                      Colors.white.withOpacity(0)
                                    ])),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20, left: defaultMargin),
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            onTap: () {
                              context.bloc<PageBloc>().add(GoToMainPage());
                              context.bloc<MovieBloc>().add(FetchMovie());
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      movieState.movieDetail.title,
                      textAlign: TextAlign.center,
                      style: blackTextStyle.copyWith(
                          fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '${movieState.movieDetail.genre} - ${movieState.movieDetail.language}',
                      textAlign: TextAlign.center,
                      style: greyTextStyle.copyWith(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RatingStar(
                          voteAverage: movieState.movieDetail.voteAverage,
                          textStyle: greyNumberTextStyle.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    Container(
                      child: Text(
                        'Cast & Crew',
                        textAlign: TextAlign.start,
                        style: blackTextStyle.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      margin: EdgeInsets.fromLTRB(defaultMargin, 24, 0, 12),
                    ),
                    SizedBox(
                      height: 116,
                      child: ListView.builder(
                          itemCount: movieState.movieDetail.crews.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (_, index) {
                            return Container(
                              margin: EdgeInsets.only(
                                  left: (index == 0) ? defaultMargin : 12,
                                  right: (index ==
                                          movieState.movieDetail.crews.length -
                                              1)
                                      ? defaultMargin
                                      : 0),
                              child: CastCrewCard(
                                name: movieState.movieDetail.crews[index].name,
                                profile_image: movieState
                                    .movieDetail.crews[index].profile_image,
                              ),
                            );
                          }),
                    ),
                    Container(
                      child: Text(
                        'Storyline',
                        textAlign: TextAlign.start,
                        style: blackTextStyle.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      margin: EdgeInsets.fromLTRB(defaultMargin, 24, 0, 8),
                    ),
                    Container(
                      child: Text(
                        movieState.movieDetail.overview,
                        textAlign: TextAlign.start,
                        style: greyTextStyle.copyWith(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                      margin: EdgeInsets.fromLTRB(
                          defaultMargin, 0, defaultMargin, 30),
                    ),
                    MaterialButton(
                      onPressed: () {
                        context
                            .bloc<PageBloc>()
                            .add(GoToSelectSchedulePage(movieDetail));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 39,
                        ),
                        width: 250,
                        height: 46,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: mainColor),
                        child: Center(
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                      ),
                    )
                  ]);
                } else {
                  return Center(
                      child: CustomSpinkit(
                    size: 70,
                  ));
                }
              },
            )
          ]),
        ));
  }
}
