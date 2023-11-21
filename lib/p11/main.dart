import 'package:flutter/material.dart';
// import 'package:pembelajaran_full/beranda.dart';
// import 'package:pembelajaran_full/nav_stor.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    pref: prefs,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.pref});
  final SharedPreferences pref;
  @override
  Widget build(BuildContext context) {
    bool getDataLogin() {
      final String email = pref.getString('email') ?? "";
      final String password = pref.getString('password') ?? "";
      return email.isNotEmpty && password.isNotEmpty;
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: getDataLogin() ? "/beranda" : "/",
      routes: {
        // "/": (context) => MyHomePage(
        //       pref: pref,
        //     ),
        // "/beranda": (context) => const BerandaPage(),
        // "/beranda/post": (context) => const po
      },
    );
  }
}
