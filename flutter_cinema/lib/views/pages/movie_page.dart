part of 'page.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //HEADER
        Container(
          decoration: BoxDecoration(
            color: accentColor3,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.fromLTRB(defaultMargin, 20, defaultMargin, 30),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (_, userState) {
              if (userState is UserLoaded) {
                if (profileImageToUpload != null) {
                  uploadImage(profileImageToUpload).then((downloadURL) {
                    profileImageToUpload = null;
                    context
                        .bloc<UserBloc>()
                        .add(UpdateData(profileImage: downloadURL));
                  });
                }
                return Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 16),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Color(0xFF5f558B),
                            width: 1,
                          )),
                      child: Stack(
                        children: <Widget>[
                          SpinKitFadingCircle(
                            color: accentColor1,
                            size: 50,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: (userState.user.profilePicture == '')
                                      ? AssetImage('assets/user_pic.png')
                                      : NetworkImage(
                                          userState.user.profilePicture),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width -
                                2 * defaultMargin -
                                78,
                            child: Text(
                              userState.user.name,
                              style: whiteTextStyle.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            NumberFormat.currency(
                                    locale: 'id_ID',
                                    decimalDigits: 0,
                                    symbol: 'IDR ')
                                .format(userState.user.balance),
                            style: yellowTextStyle.copyWith(
                                fontSize: 14, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else {
                return SpinKitFadingCircle(
                  color: accentColor1,
                  size: 50,
                );
              }
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: defaultMargin, top: 30, bottom: 12),
          child: Text(
            'Now Playing',
            style: blackTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (_, movieState) {
              if (movieState is MovieLoaded) {
                List<Movie> movies = movieState.movies.sublist(0, 9);

                return ListView.builder(
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Container(
                    child: MovieCard(
                      movie: movies[index],
                      onTap: () {
                        context
                            .bloc<PageBloc>()
                            .add(GoToMovieDetailPage(movies[index].id));
                      },
                    ),
                    margin: EdgeInsets.only(
                        left: (index == 0) ? defaultMargin : 0,
                        right:
                            (index == movies.length - 1) ? defaultMargin : 16),
                  ),
                );
              } else {
                return SpinKitCircle(
                  size: 50,
                  color: mainColor,
                );
              }
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: defaultMargin, top: 30, bottom: 12),
          child: Text(
            'Browse Movie',
            style: blackTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        BlocBuilder<UserBloc, UserState>(
          builder: (_, userState) {
            if (userState is UserLoaded) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Row(
                  children:
                      List.generate(userState.user.genres.length, (index) {
                    return Container(
                      margin: EdgeInsets.only(
                          left: (index == 0) ? 0 : 38, right: 0),
                      child: BrowseButton(
                        genre: userState.user.genres[index],
                      ),
                    );
                  }),
                ),
              );
            } else {
              return SpinKitCircle(
                size: 50,
                color: mainColor,
              );
            }
          },
        ),
        Container(
          margin: EdgeInsets.only(left: defaultMargin, top: 30, bottom: 12),
          child: Text(
            'Coming Soon',
            style: blackTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 30),
          width: 100,
          height: 140,
          child: BlocBuilder<MovieBloc, MovieState>(
            builder: (_, movieState) {
              if (movieState is MovieLoaded) {
                List<Movie> movies = movieState.movies.sublist(10);
                return ListView.builder(
                  itemCount: movies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        left: (index == 0) ? 0 : 16,
                      ),
                      child: ComingSoonCard(
                        movie: movies[index],
                      ),
                    );
                  },
                );
              } else {
                return SpinKitFadingCircle(
                  color: accentColor1,
                  size: 50,
                );
              }
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: defaultMargin, top: 0, bottom: 13),
          child: Text(
            'Daily Promo',
            style: blackTextStyle.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Column(
            children: dummyPromos
                .map((promo) => Padding(
                      padding: EdgeInsets.fromLTRB(
                          defaultMargin, 0, defaultMargin, 16),
                      child: PromoCard(
                        promo: promo,
                      ),
                    ))
                .toList(),
          ),
        ),
        SizedBox(
          height: 100,
        )
      ],
    );
  }
}
