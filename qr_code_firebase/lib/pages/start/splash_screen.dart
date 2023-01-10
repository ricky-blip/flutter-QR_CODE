part of '../pages.dart';

//SPLASH SCREEN
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    //NOTE Timer
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Splash(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("QR CODE with Firebase"),
      ),
    );
  }
}

//CHECKING
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    //Use Stream as observe data for auto LOGIN
    return StreamBuilder<User?>(
      stream: auth.authStateChanges(),
      builder: (context, snapshot) {
        //Conditional for connection to firebase
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        }

        return MaterialApp(
          title: 'QR Code',
          initialRoute: snapshot.hasData ? '/HomePage' : '/Login',
          routes: {
            '/SplashScreen': (context) => const Splash(),
            '/Login': (context) => const LoginPage(),
            '/HomePage': (context) => const HomePage(),
          },
          home: const Splash(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
