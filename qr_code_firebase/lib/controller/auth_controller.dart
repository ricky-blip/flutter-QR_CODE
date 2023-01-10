part of 'controller.dart';

class AuthController extends StatefulWidget {
  const AuthController({super.key});

  @override
  State<AuthController> createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController> {
  // condition is auth or not -> base uid
  // null : no user login
  // uid : user login
  String? uid;
  late FirebaseAuth auth;

  @override
  void initState() {
    auth = FirebaseAuth.instance;

    //always observe
    auth.authStateChanges().listen(
      (event) {
        uid = event?.uid;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
