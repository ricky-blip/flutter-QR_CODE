part of 'controller.dart';

class AuthController {
  // condition is auth or not -> base uid
  // null : no user login
  // uid : user login
  String? uid;
  late FirebaseAuth auth;

  void onInit() {
    auth = FirebaseAuth.instance;

    //always observe
    auth.authStateChanges().listen(
      (event) {
        uid = event?.uid;
      },
    );
  }

  //Function
  Future<Map<String, dynamic>> login(String email, String pass) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: pass);
      return {
        "error": false,
        "message": "Berhasil Login",
      };
    } on FirebaseAuthException catch (e) {
      return {
        "error": true,
        "message": "${e.message}",
      };
    } catch (e) {
      return {
        "error": true,
        "message": "Tidak dapat Login",
      };
    }
  }
}
