import 'package:flutter/material.dart';
// import 'package:pembelajaran_full/beranda.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.pref});
  final SharedPreferences pref;
  @override
  Widget build(BuildContext context) {
    final TextEditingController emailControler = TextEditingController();
    final TextEditingController passwordControler = TextEditingController();
    void save() async {
      await pref.setString("email", emailControler.text);
      await pref.setString("password", passwordControler.text);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        elevation: 0,
        title: new Image.asset('asset/tw.png', height: 50, width: 50),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              SizedBox(
                height: 40,
              ),
              Text(
                "Welcome",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                "asset/mid.png",
                height: 200,
              ),
              SizedBox(
                height: 100,
              ),
              CostumTextField(
                title: "username",
                ctr: emailControler,
              ),
              SizedBox(
                height: 16,
              ),
              CostumTextField(
                title: "password",
                ctr: passwordControler,
              ),
              SizedBox(
                height: 16,
              ),
              ElevatedButton(
                onPressed: () {
                  if (emailControler.text.isNotEmpty &&
                      passwordControler.text.isNotEmpty) {
                    save();
                    Navigator.pushReplacementNamed(context, "/beranda");
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Email/password belum di isi"),
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: 150, vertical: 14),
                  primary: Colors.white,
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                child: Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CostumTextField extends StatelessWidget {
  const CostumTextField({super.key, required this.title, required this.ctr});
  final String title;
  final TextEditingController ctr;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("$title"),
        SizedBox(
          height: 6,
        ),
        TextFormField(
          obscureText: title == "password" ? true : false,
          controller: ctr,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.pinkAccent,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.pinkAccent,
                width: 1,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
