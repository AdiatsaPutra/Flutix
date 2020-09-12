part of 'pages.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int botomNavigationBarIndex;
  PageController pageController;

  @override
  void initState() {
    super.initState();

    botomNavigationBarIndex = 0;
    pageController = PageController(initialPage: botomNavigationBarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: accentColor1,
        ),
        SafeArea(
            child: Container(
          color: Color(0xFFF6F7F9),
        )),
        ListView(),
        buildBottomNavigationBar(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: 46,
              width: 46,
              margin: EdgeInsets.only(bottom: 42),
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: accentColor2,
                onPressed: () {},
                child: SizedBox(
                  height: 26,
                  width: 26,
                  child: Icon(
                    MdiIcons.walletPlus,
                    color: Colors.black.withOpacity(0.7),
                  ),
                ),
              )),
        )
      ],
    ));
  }

  Widget buildBottomNavigationBar() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipPath(
        clipper: BottomNavBarClipper(),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: mainColor,
              unselectedItemColor: Color(0xFFE5E5E5),
              currentIndex: botomNavigationBarIndex,
              onTap: (index) {
                setState(() {
                  botomNavigationBarIndex = index;
                });
              },
              items: [
                BottomNavigationBarItem(
                    title: Text(
                      'New Movies',
                      style: GoogleFonts.raleway(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    icon: Container(
                        margin: EdgeInsets.only(bottom: 6),
                        height: 20,
                        child: (botomNavigationBarIndex == 0)
                            ? Icon(Icons.slideshow, color: mainColor)
                            : Icon(
                                Icons.slideshow,
                                color: Colors.grey,
                              ))),
                BottomNavigationBarItem(
                    title: Text(
                      'My Tickets',
                      style: GoogleFonts.raleway(
                          fontSize: 13, fontWeight: FontWeight.w600),
                    ),
                    icon: Container(
                        margin: EdgeInsets.only(bottom: 6),
                        height: 20,
                        child: (botomNavigationBarIndex == 1)
                            ? Icon(Icons.shop, color: mainColor)
                            : Icon(
                                Icons.shop,
                                color: Colors.grey,
                              ))),
              ]),
        ),
      ),
    );
  }
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
