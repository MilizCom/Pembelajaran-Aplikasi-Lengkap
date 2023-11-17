import 'package:flutter/material.dart';
import 'package:pembelajaran_full/beranda.dart';
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
        title: Text("X"),
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
                    padding: EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 100,
                    ),
                    elevation: 0),
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
          controller: ctr,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.pinkAccent,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
