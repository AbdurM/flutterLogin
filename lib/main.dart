import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void OnPressLogin() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
                padding: EdgeInsets.only(top: 15.0, left: 30),
                child: Text(
                  "Let's sign you in.",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                )),
            const Padding(
              padding: EdgeInsets.only(top: 15.0, left: 30),
              child: Text("Welcome back.\nYou've been missed!",
                  style: TextStyle(fontSize: 35)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: "Phone, emai or username"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: "Password"),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 250.0),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: (TextSpan(
                        style: TextStyle(fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(text: "Don't have an account? "),
                          TextSpan(
                              text: 'Register',
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ])),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 40, right: 40),
              child: ElevatedButton(
                onPressed: OnPressLogin,
                child: Text(
                  "Sign in",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    minimumSize: const Size.fromHeight(60),
                    primary: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
