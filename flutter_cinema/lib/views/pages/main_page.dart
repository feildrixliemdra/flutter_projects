part of 'page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavbarIndex;
  PageController pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomNavbarIndex = 0;
    pageController = PageController(initialPage: bottomNavbarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: accentColor3,
        ),
        SafeArea(child: Container(color: Color(0xFFF6F7F9))),
        PageView(
          controller: pageController,
          children: <Widget>[
            MoviePage(),
            Center(child: Text('My Ticket', style: TextStyle(color: mainColor)))
          ],
          onPageChanged: (index) {
            setState(() {
              bottomNavbarIndex = index;
            });
          },
        ),
        customBottomNavbar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(bottom: 42),
            height: 46,
            width: 46,
            child: FloatingActionButton(
              backgroundColor: accentColor1,
              elevation: 0,
              onPressed: () {
                context.bloc<UserBloc>().add(SignOut());
                AuthService.signOut();
              },
              child: Icon(
                MdiIcons.walletPlus,
                color: Colors.black.withOpacity(0.54),
              ),
            ),
          ),
        )
      ],
    ));
  }

  Widget customBottomNavbar() => Align(
        alignment: Alignment.bottomCenter,
        child: ClipPath(
          clipper: BottomNavBarClipper(),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: mainColor,
              unselectedItemColor: Color(0xFFe5e5e5),
              currentIndex: bottomNavbarIndex,
              onTap: (index) {
                setState(() {
                  bottomNavbarIndex = index;
                  pageController.jumpToPage(index);
                });
              },
              items: [
                BottomNavigationBarItem(
                    title: Text(
                      'New Movies',
                      style: GoogleFonts.raleway(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    icon: Container(
                      height: 18,
                      width: 24,
                      child: Image.asset(bottomNavbarIndex == 0
                          ? 'assets/ic_movie.png'
                          : 'assets/ic_movie_grey.png'),
                    )),
                BottomNavigationBarItem(
                    title: Text(
                      'New Movies',
                      style: GoogleFonts.raleway(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    icon: Container(
                      height: 18,
                      width: 24,
                      child: Image.asset(bottomNavbarIndex == 1
                          ? 'assets/ic_tickets.png'
                          : 'assets/ic_tickets_grey.png'),
                    ))
              ],
            ),
          ),
        ),
      );
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2 - 28, 0);
    path.quadraticBezierTo(size.width / 2 - 28, 33, size.width / 2, 33);
    path.quadraticBezierTo(size.width / 2 + 28, 33, size.width / 2 + 28, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}