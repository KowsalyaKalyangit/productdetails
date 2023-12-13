import '../allpackages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.of(context).pushReplacement(
              PageRouteBuilder(
                fullscreenDialog: true,
                transitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (BuildContext context, Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                  return const ProductListPage();
                },
                transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) {
                  return FadeTransition(
                    opacity:
                        animation, // CurvedAnimation(parent: animation, curve: Curves.elasticInOut),
                    child: const ProductListPage(),
                  );
                },
              ),
            )

        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //     builder: (BuildContext context) => const LoginScreen())
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 100.0.hp,
            width: 100.0.wp,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    appcolor,
                    appcolor1,
                  ]),
            ),
          ),
          Positioned.fill(
              child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    height: 10.0.hp,
                    child: Image.asset(
                      'assets/cart.png',
                      color: screenbackground,
                    )),
                Text(
                  'dailefresh',
                  style: heading,
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
