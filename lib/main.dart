import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _passwordTextController = TextEditingController();
  var _isPasswordInvalid = false;
  double _topMarginOfSignInButton = 200;

  void onPressLogin() {
    setState(() {
      if (_isPasswordInvalid) {
        _topMarginOfSignInButton = _topMarginOfSignInButton == 200 ? 20 : 200;
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.only(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 15, left: 30),
              child: Text(
                "Let's sign you in.",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15, left: 30),
              child: Text(
                "Welcome back.\nYou've been missed!",
                style: TextStyle(fontSize: 35),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              child: TextField(
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Phone, email or username',
                ),
              ),
            ),
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: _passwordTextController,
                  onChanged: (value) {
                    setState(() {
                      _isPasswordInvalid = _passwordTextController.text !=
                          '12345678'; // for the sake of example
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Password',
                    errorText: _isPasswordInvalid ? 'Incorrect Password' : null,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 330,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    height: 140,
                    width: MediaQuery.of(context).size.width,
                    top: _topMarginOfSignInButton,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    child: GestureDetector(
                      onTap: onPressLogin,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                  style: TextStyle(fontSize: 15),
                                  children: [
                                    TextSpan(text: "Don't have an account? "),
                                    TextSpan(
                                      text: 'Register',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                            ),
                            child: ElevatedButton(
                              onPressed: _isPasswordInvalid ? null : () => {},
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                minimumSize: const Size.fromHeight(60),
                                backgroundColor: Colors.white,
                                disabledBackgroundColor: Colors.grey,
                              ),
                              child: const Text(
                                'Sign in',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
