part of '../pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //NOTE Field
  final AuthController authC = AuthController();
  final LoginController loginC = LoginController();

  final TextEditingController emailC =
      TextEditingController(text: "admin@gmail.com");
  final TextEditingController passC = TextEditingController(text: "admin123");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Colors.orange,
        title: const Text("Login"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: emailC,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: passC,
            autocorrect: false,
            obscureText: loginC.isHidden,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: "Password",
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    loginC.isHidden = !loginC.isHidden;
                  });
                },
                icon: Icon(
                  loginC.isHidden ? Icons.visibility : Icons.visibility_off,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {
              if (loginC.isLoading) {
                // . . . . .
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            child: Text(loginC.isLoading ? "LOGIN" : "LOADING..."),
          ),
        ],
      ),
    );
  }
}
