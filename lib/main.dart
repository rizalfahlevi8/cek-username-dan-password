import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi cek username dan password',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Cek Username dan Password'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController usernameInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(widget.title),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 20,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Muhammad Rizal Fahlevi",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const Text("E31221281",
                style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 50.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                controller: usernameInputController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                  hintText: "Inputkan Email",
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: TextField(
                obscureText: true,
                controller: passwordInputController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Inputkan Password",
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            TextButton(
              onPressed: getData,
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool validUsername(String username) {
    bool mengandungAt = false;
    bool mengandungDot = false;

    for (int i = 0; i < username.length; i++) {
      if (username[i] == '@') {
        mengandungAt = true;
      } else if (username[i] == '.') {
        mengandungDot = true;
      }
    }

    return mengandungAt && mengandungDot;
  }

  bool validPassword(String password) {
    if (password.length < 10) {
      return false;
    }

    bool huruf = false;
    bool angka = false;

    for (int i = 0; i < password.length; i++) {
      if (password[i].contains(RegExp(r'[a-zA-Z]'))) {
        huruf = true;
      } else if (password[i].contains(RegExp(r'[0-9]'))) {
        angka = true;
      }
    }

    return huruf && angka;
  }

  void showSnackBar(String info) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(info),
      ),
    );
  }

  void getData() {
    String username = usernameInputController.text;
    String password = passwordInputController.text;

    if (validUsername(username) && validPassword(password)) {
      showSnackBar("username dan password valid");
    } else if (!validUsername(username) && !validPassword(password)) {
      showSnackBar("username dan password tidak valid");
    } else {
      if (!validUsername(username)) {
        showSnackBar("Username tidak valid, karena tidak mengandung @ dan .");
        return;
      }
      if (!validPassword(password)) {
        showSnackBar(
            "Password tidak valid, karena mungkin tidak mengandung (angka dan huruf) atau panjang karakter kurang dari 10");
        return;
      }
    }
  }
}
